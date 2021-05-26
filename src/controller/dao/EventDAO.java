package dao;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.EventVO;
 
public class EventDAO {
    private final String driverClassName = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://127.0.0.1:3306/injava?useUnicode=true&characterEncoding=euckr";
    private final String username = "root";
    private final String password = "asdf";
    
    // 테이블 : board , 기능 : 데이터 수정 
    public int updateBoard(EventVO evo) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "UPDATE event SET event_name=?, event_content=?, event_startdate=?, event_enddate=?, event_banner=? WHERE event_number=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,evo.getEventName());
            statement.setString(2,evo.getEventContent());
            statement.setString(3,evo.getEventSdate());
            statement.setString(4,evo.getEventEdate());
            statement.setString(5,evo.getEventBanner());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 삭제 
    public int deleteBoard(EventVO board) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "DELETE FROM event WHERE event_number=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1,board.getEventNumber());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 하나의 데이터 가져오기
    public EventVO selectBoardByKey(int event_number) {
        EventVO board = null;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT event_number, event_name, event_content , event_startdate, event_enddate, event_banner WHERE board_no=?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, event_number);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                board = new EventVO();
                board.setEventNumber(event_number);
                board.setEventName(resultset.getString("event_name"));
                board.setEventContent(resultset.getString("event_content"));
                board.setEventSdate(resultset.getString("event_startdate"));
                board.setEventEdate(resultset.getString("event_enddate"));
                board.setEventBanner(resultset.getString("event_banner"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return board;
    }
    
    // 테이블 : board , 기능 : 한 페이지의 데이터 가져오기 
    public List<EventVO> selectBoardListPerPage(int beginRow, int pagePerRow) {
        List<EventVO> list = new ArrayList<EventVO>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT event_number, event_name, event_content, event_startdate, event_enddate, event_banner  FROM event_table LIMIT ?, ?";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, beginRow);
            statement.setInt(2, pagePerRow);
            resultset = statement.executeQuery();
            while(resultset.next()) {
                EventVO evo = new EventVO();
                evo.setEventNumber(resultset.getInt("event_number"));
                evo.setEventName(resultset.getString("event_name"));
                evo.setEventContent(resultset.getString("event_content"));
                evo.setEventSdate(resultset.getString("event_startdate"));
                evo.setEventEdate(resultset.getString("event_enddate"));
                evo.setEventEdate(resultset.getString("event_banner"));
                list.add(evo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return list;
    }
    
    // 테이블 : board , 기능 : 전체 로우 카운터 가져오기
    public int selectTotalBoardCount() {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultset = null;
        String sql = "SELECT COUNT(*) FROM board";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            resultset = statement.executeQuery();
            if(resultset.next()) {
                rowCount = resultset.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, resultset);
        }
        return rowCount;
    }
    
    // 테이블 : board , 기능 : 데이터 입력하기
    public int insertEvent(EventVO evo) {
        int rowCount = 0;
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "INSERT INTO board(event_name, event_content, event_startdate, event_enddate, event_banner) values(?,?,?,?,?)";
        try {
            connection = this.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1,evo.getEventName());
            statement.setString(2,evo.getEventContent());
            statement.setString(3,evo.getEventSdate());
            statement.setString(4,evo.getEventEdate());
            statement.setString(4,evo.getEventBanner());
            rowCount = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.close(connection, statement, null);
        }
        return rowCount;
    }
    
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName(this.driverClassName);
            connection = DriverManager.getConnection(this.url, this.username, this.password);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    private void close(Connection connection, Statement statement, ResultSet resultset) {
        if(resultset != null) {
            try {
                resultset.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
