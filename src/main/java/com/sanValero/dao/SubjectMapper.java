package com.sanValero.dao;

import com.sanValero.domain.Subject;
import com.sanValero.util.DateUtils;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SubjectMapper implements RowMapper<Subject> {

    @Override
    public Subject map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Subject(
                rs.getInt("ID_SUBJECT"),
                rs.getString("SUBJECT_NAME"),
                rs.getString("SUBJECT_DESCRIPTION"),
                rs.getString("SUBJECT_YEAR"),
                rs.getString("DURATION"),
                rs.getString("TEACHER"),
                rs.getString("IMAGE"));
    }
}
