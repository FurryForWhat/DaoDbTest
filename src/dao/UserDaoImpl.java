package src.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import database.ConnectionFactory;
import model.User;

public abstract class UserDaoImpl extends AbstractDaoImpl<User> implements UserDao{
    // protected ConnectionFactory connectionFactory;
    // protected Connection connection;

    // public UserDaoImpl(){
    //     this.connectionFactory = new ConnectionFactory();
    //     this.connection = connectionFactory.createConnection();
    // }

    @Override
	public String getTableName() {
		return "userTable";
	}

    @Override
	public String getInsertValues() {
		return "(name, age, email , father) values (?, ?, ?, ?)";
	}

    @Override
    public void setParameters(PreparedStatement preparedStatement, User entity){
        try{
            preparedStatement.setString(1, entity.getName());
            preparedStatement.setInt(2, entity.getAge());
            preparedStatement.setString(3, entity.getEmail());
            preparedStatement.setString(4, entity.getFatherName());
        }catch(SQLException e){
            System.err.println(e.getMessage());
        }
    }

}
