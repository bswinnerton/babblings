module PostsHelper
  SIZES = {
    small: 210,
    medium: 284,
    large: 350
  }

  def calculate_width(width = SIZES[:large])
    width
  end

  def calculate_height(width, height)
    (SIZES[:large] * calculate_ratio(width, height)).to_i
  end

private

  def calculate_ratio(width, height)
    height.to_f / width.to_f
  end
end
