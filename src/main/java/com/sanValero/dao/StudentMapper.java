package com.sanValero.dao;

import com.sanValero.domain.Student;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

public class StudentMapper implements RowMapper<Student> {


    @Override
    public Student map(ResultSet rs, StatementContext ctx) throws SQLException {

        return new Student(rs.getInt("id_student"),
                rs.getString("first_Name"),
                rs.getString("last_Name"),
                rs.getString("DNI"),
                rs.getString("address"),
                rs.getString("telephone"),
                rs.getString("image")

        );
    }
}
