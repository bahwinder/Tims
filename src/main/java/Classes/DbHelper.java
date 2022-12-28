package Classes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mongodb.Block;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Collation;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.List;

public class DbHelper {
    MongoClientURI uri = new MongoClientURI("mongodb+srv://bobin13:bobin123@cluster0.wi0uk9y.mongodb.net/?retryWrites=true&w=majority");
    ArrayList<String> list = new ArrayList<>();
    Gson g;
    String tempString;
    public JsonArray connect(String input) {
        try(MongoClient mongoClient = new MongoClient(uri)) {
            MongoDatabase db = mongoClient.getDatabase("tims_app");
            MongoCollection<Document> collection = db.getCollection("stores");
            Document query = new Document("city",input);

            list.clear();
            g = new Gson();
            JsonObject object = new JsonObject();
            JsonArray array = new JsonArray();

            for(Document d : collection.find(query)){
                tempString = g.toJson(d);
                System.out.println(tempString);

                //com.mongodb.util.JSON.serialize(d);
                array.add(tempString);

            }
            return array;

        }
    }

    public boolean insert(String name,String address,String city,String rating){

        try(MongoClient mongoClient = new MongoClient(uri)){
            MongoDatabase db = mongoClient.getDatabase("tims_app");
            MongoCollection<Document> collection = db.getCollection("stores");
            Document doc = new Document("name",name)
                    .append("city",city)
                    .append("address",address)
                    .append("rating",rating);
            collection.insertOne(doc);
            return true;
        }catch (Exception e){
            return false;
        }

    }

    //overloaded constructor
    public boolean insert(String name,String address,String city,int rating,boolean hasOutlets,int hotness){
        try{

            return true;
        }
        catch(Exception e){

            return false;
        }
    }
    void disconnect() {

    }
}
