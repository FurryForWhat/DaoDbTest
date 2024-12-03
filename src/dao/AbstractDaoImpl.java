package src.dao;

import database.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class AbstractDaoImpl<T> implements AbstractDao<T>{
    protected ConnectionFactory connectionFactory;
    protected Connection connection;

    public AbstractDaoImpl(){
        this.connectionFactory = new ConnectionFactory();
        this.connection =connectionFactory.createConnection();
    }

    
    public abstract void setParameters(PreparedStatement preparedStatement, T entity) throws SQLException;

    public abstract String getTableName();

    public abstract String getInsertValues();


    public String getInsertQuery() {
		String query = "insert into " + getTableName() + " " + this.getInsertValues();
		return query;
	}

    public void create(T entity){
		String query = this.getInsertQuery();
		try {
			Connection connection = this.connectionFactory.createConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			this.setParameters(preparedStatement, entity);
			preparedStatement.executeUpdate();
		} catch(SQLException e){
			System.out.print(e.getMessage());
		}finally {
			this.connectionFactory.closeConnection();
		}
	}

    public void delete(int id){
    try{
        String query = "delete from "+this.getTableName() + " where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }catch(SQLException e){
        System.out.print(e.getMessage());
    }finally{
        this.connectionFactory.closeConnection();
    }
    }


}
