package com.Svalero.dao;

import com.Svalero.domain.Student;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentMapper implements RowMapper<Student> {

    @Override
    public Student map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Student(rs.getInt("id_student"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("dni"),
                rs.getString("address"),
                rs.getString("telephone"),
                rs.getString("image"));
    }
}
