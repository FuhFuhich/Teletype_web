package com.example.teletypesha.itemClass;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;

public class Chat {
    Integer yourId;
    ArrayList<Message> messages;
    HashMap<Integer, User> users;
    String label, chatId, pass;
    public boolean isChanged = false;

    public Chat(Integer yourId, ArrayList<Message> messages, HashMap<Integer, User> users, String chatId, String pass){
        this.yourId = yourId;
        this.messages = messages;
        this.users = users;
        this.chatId = chatId;
        this.pass = pass;
    }

    public Integer GetYourId(){
        return yourId;
    }

    public String GetLabel(){
        if(label != null){
            return label;
        }
        else{
            return chatId;
        }
    }

    public void AddChangeMessage(Message msg){
        Message getMsg = GetMessangeForId(msg.messageId, msg.author);
        if(getMsg != null){
            messages.remove(getMsg);
        }
        messages.add(msg);
    }

    public String GetChatId(){
        return chatId;
    }

    public String GetChatPass(){
        return pass;
    }

    public void SetLabel(String label){
        this.label = label;
    }

    public HashMap<Integer, User> GetUsers(){
        return users;
    }

    public int GetWritedUsers(){
        HashSet<Integer> uniqueAuthors = new HashSet<>();
        for (Message msg : messages) {
            uniqueAuthors.add(msg.author);
        }
        return uniqueAuthors.size();
    }

    public User GetUser(int id){
        return users.get(id);
    }

    public Message getLastMsg(){
        if(messages != null && messages.size() > 0){
            return messages.get(messages.size() - 1);
        }
        else{
            return null;
        }
    }

    public ArrayList<Message> GetMessanges(){
        return messages;
    }

    public Message GetMessangeForId(Integer id, Integer authorId){
        for (int i = 0; i < messages.size(); i++) {
            if (Objects.equals(messages.get(i).messageId, id) && Objects.equals(messages.get(i).author, authorId)){
                return messages.get(i);
            }
        }
        return null;
    }

    public void AddUser(Integer id, User user){
        users.put(id, user);
    }

    public HashMap<Integer, ArrayList<Integer>> GetMissingIdsForAllAuthors(){
        HashMap<Integer, ArrayList<Integer>> allMessageIdsForAllAuthors = new HashMap<>();
        HashMap<Integer, Integer> lastMsgIdForAllAuthors = new HashMap<>();
        HashMap<Integer, ArrayList<Integer>> missingMessageIdsForAllAuthors = new HashMap<>();

        if (messages == null)
            return null;
        for(Message msg : messages){
            if(users.containsKey(msg.author)){
                allMessageIdsForAllAuthors.putIfAbsent(msg.author, new ArrayList<>());
                allMessageIdsForAllAuthors.get(msg.author).add(msg.messageId);
                lastMsgIdForAllAuthors.put(msg.author, Math.max(lastMsgIdForAllAuthors.getOrDefault(msg.author, 0), msg.messageId));
            }
        }


        for(Integer authorId : users.keySet()){
            allMessageIdsForAllAuthors.putIfAbsent(authorId, new ArrayList<>());
            lastMsgIdForAllAuthors.putIfAbsent(authorId, 0);
        }

        for(Integer authorId : allMessageIdsForAllAuthors.keySet()){
            ArrayList<Integer> allMessageIds = allMessageIdsForAllAuthors.get(authorId);
            ArrayList<Integer> missingMessageIds = new ArrayList<>();
            int lastMsgId = lastMsgIdForAllAuthors.get(authorId);
            for(int i = 1; i <= lastMsgId; i++){
                if(!allMessageIds.contains(i)){
                    missingMessageIds.add(i);
                }
            }

            System.out.println("Missing message IDs for author " + authorId + ": " + missingMessageIds);
            System.out.println("Last message ID for author " + authorId + ": " + lastMsgId);

            // Добавляем 0 в список отсутствующих ID, если у автора нет сообщений
            if(lastMsgId == 0) {
                missingMessageIds.add(0);
            } else {
                missingMessageIds.add(lastMsgId);
            }
            missingMessageIdsForAllAuthors.put(authorId, missingMessageIds);
        }

        return missingMessageIdsForAllAuthors;
    }

    public void CleanErased(ArrayList<Integer> erased) {
        HashSet<Integer> erasedSet = new HashSet<>(erased);
        Iterator<Message> iterator = messages.iterator();

        while (iterator.hasNext()) {
            Message message = iterator.next();
            if (erasedSet.contains(message.messageId)) {
                iterator.remove();
            }
        }
    }

    public void SortMessagesByTime() {
        Collections.sort(messages, new Comparator<Message>() {
            @Override
            public int compare(Message m1, Message m2) {
                if ((m1.GetTimeInSeconds() != -1) && (m2.GetTimeInSeconds() != -1)) {
                    return Long.compare(m1.GetTimeInSeconds(), m2.GetTimeInSeconds());
                } else {
                    return Long.compare(m1.messageId, m2.messageId);
                }

            }
        });
    }

    public void RemoveMessage(int messageId, int authorId) {
        Message message = GetMessangeForId(messageId, authorId);
        if (message != null) {
            messages.remove(message);
        }
    }
}
