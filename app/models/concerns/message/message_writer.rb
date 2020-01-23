module Message
  class MessageWriter
    class << self
      def message(body)
        "#{body}(#{Time.new.strftime("%d日%H時%M分")})"
      end

      def write_user_log_file(user, messages)
        file_path = File.join(Rails.root, 'tmp/user', user.character_id)
        self.write_log_file(file_path, messages)
      end

      def write_map_log_file(messages)
        file_path = File.join(Rails.root, 'tmp/game/map')
        self.write_log_file(file_path, messages)
      end

      def write_log_file(file_path, messages)
        lines = []
        if File.exist?(file_path)
          File.foreach(file_path) do |line|
            lines << line.chomp
          end
        end

        lines.unshift(messages)
        lines.flatten!

        File.open(file_path, "w+") do |f|
          lines.each do |line|
            f.puts line
          end
        end
      end
    end
  end
end