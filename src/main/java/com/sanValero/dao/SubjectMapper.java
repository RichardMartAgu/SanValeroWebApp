package com.sanValero.dao;

import com.sanValero.domain.Subject;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

public class SubjectMapper implements RowMapper<Subject> {

    @Override
    public Subject map(ResultSet rs, StatementContext ctx) throws SQLException {


        return new Subject(rs.getInt("id_subject"),
                rs.getString("subject_name"),
                rs.getString("subject_description"),
                rs.getString("subject_year"),
                rs.getString("duration"),
                rs.getString("teacher"),
                rs.getString("image")

        );

    }
}