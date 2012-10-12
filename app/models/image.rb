class Image < ActiveRecord::Base

  MAX_SIZE_IN_MB = 5

  belongs_to :entity, :polymorphic => true

  image_accessor :image

  validates :image, :presence => {}, :length => { :maximum => MAX_SIZE_IN_MB.megabytes }, :unless => "remove_image"
  validates_property :mime_type, :of => :image, :in => %w(image/jpeg image/png image/gif image/tiff), :message => :incorrect_format
  acts_as_indexed :fields => [:title]

  delegate :size, :mime_type, :url, :width, :height, :to => :image

  after_save do |image|
    image.destroy unless image.image
  end

  def thumbnail(geometry = nil)
    if geometry.is_a?(Symbol) and self.class.user_image_sizes.keys.include?(geometry)
      geometry = self.class.user_image_sizes[geometry]
    end

    if geometry.present? && !geometry.is_a?(Symbol)
      image.thumb(geometry)
    else
      image
    end
  end

  def thumbnail_dimensions(geometry)
    geometry = geometry.to_s
    width = original_width = self.image_width.to_f
    height = original_height = self.image_height.to_f
    geometry_width, geometry_height = geometry.to_s.split(%r{\#{1,2}|\+|>|!|x}im)[0..1].map(&:to_f)
    if (original_width * original_height > 0) && geometry =~ ::Dragonfly::ImageMagick::Processor::THUMB_GEOMETRY
      if geometry =~ ::Dragonfly::ImageMagick::Processor::RESIZE_GEOMETRY
        if geometry !~ %r{\d+x\d+>} || (geometry =~ %r{\d+x\d+>} && (width > geometry_width.to_f || height > geometry_height.to_f))
          # Try scaling with width factor first. (wf = width factor)
          wf_width = (original_width * (geometry_width / width)).ceil
          wf_height = (original_height * (geometry_width / width)).ceil

          # Scale with height factor (hf = height factor)
          hf_width = (original_width * (geometry_height / height)).ceil
          hf_height = (original_height * (geometry_height / height)).ceil

          # Take the highest value that doesn't exceed either axis limit.
          use_wf = wf_width <= geometry_width && wf_height <= geometry_height
          if use_wf && hf_width <= geometry_width && hf_height <= geometry_height
            use_wf = wf_width * wf_height > hf_width * hf_height
          end

          if use_wf
            width = wf_width
            height = wf_height
          else
            width = hf_width
            height = hf_height
          end
        end
      else
        # cropping
        width = geometry_width
        height = geometry_height
      end
    end

    {:width => width.to_i, :height => height.to_i}
  end

  def title
    CGI::unescape(image_name.to_s).gsub(/\.\w+$/, '').titleize
  end

end