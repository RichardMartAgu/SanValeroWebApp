package com.sanValero.DAO;

import com.sanValero.Domain.Register;
import com.sanValero.Domain.Student;
import com.sanValero.Domain.Subject;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

public class RegisterMapper implements RowMapper<Register> {

    @Override
    public Register map(ResultSet rs, StatementContext ctx) throws SQLException {


        Database.connect();
        Student student = Database.jdbi.withExtension(StudentDAO.class,
                dao -> dao.searchStudent(rs.getInt("id_student")));

        Subject subject = Database.jdbi.withExtension(SubjectDAO.class,
                dao -> dao.searchSubject(rs.getInt("id_subject")));

    return new Register(rs.getInt("id_register")
            , student
            , subject
            , rs.getDate("register_date").toLocalDate());
    }
}
