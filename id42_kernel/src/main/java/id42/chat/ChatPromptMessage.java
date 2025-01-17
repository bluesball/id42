package id42.chat;

public class ChatPromptMessage {
    private final String message;

    public ChatPromptMessage(String message) {
        this.message = message;
    }

    public static ChatPromptMessage of(String message) {
        var chatMessage = new ChatPromptMessage(message);
        return chatMessage;
    }

    public String message() {
        return message;
    }
}
