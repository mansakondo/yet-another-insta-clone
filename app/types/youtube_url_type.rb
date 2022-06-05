class YouTubeURLType < ActiveRecord::Type::String
  private
    def cast_value(value)
      return unless valid_youtube_url?(value)

      video_id = extract_video_id_from(value)

      "https://www.youtube.com/embed/#{video_id}"
    end

    def valid_youtube_url?(value)
      value =~ pattern
    end

    def extract_video_id_from(value)
      matches = value.scan(pattern)
      matches.first.last
    end

    def pattern
      /https\:\/\/(w{3}\.)?youtu.+\/(embed\/)?(.+\w)/
    end
end
