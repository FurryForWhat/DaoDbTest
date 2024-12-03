package model;


public class User {
    private int id;
    private String name;
    private int age;
    private String email;
    private String fatherName;
    // private List<user> user = new ArrayList<user>();
    
    public String getName(){
        return this.name;
    }
    public String getEmail(){
        return this.email;
    }
    public String getFatherName(){
        return this.fatherName;
    }
    public int getAge(){
        return this.age;
    }

    public User(String name,int age, String email,String fatherName){
        this.name = name;
        this.age = age;
        this.email = email;
        this.fatherName = fatherName;
        
    }

    @Override
    public String toString(){
        return "**** UserSection****\n"+
                "id :"+this.id + "name :"+this.name+
                "age :"+this.age + "email :"+this.email+
                "father name :"+this.fatherName+"\n";
    }
}
