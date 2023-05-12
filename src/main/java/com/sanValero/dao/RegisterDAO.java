package com.sanValero.dao;

import com.sanValero.domain.Register;

import java.time.LocalDate;
import java.util.List;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

public interface RegisterDAO {

    @SqlQuery("SELECT * FROM REGISTERS")
    @UseRowMapper(RegisterMapper.class)
    List<Register> getRegisters();

    @SqlUpdate("INSERT INTO registers (id_student, id_subject, register_date) VALUES (?, ?, ?)")
    void addRegister(int id_student, int id_subject, LocalDate date);

    @SqlUpdate("DELETE FROM registers WHERE id_register = ?")
    void deleteRegister(int id_register);


    @SqlQuery("SELECT * FROM registers WHERE id_student = ?")
    @UseRowMapper(RegisterMapper.class)
    List<Register> searchStudentRegister(int id_student);

    @SqlUpdate("DELETE FROM registers WHERE id_student = ?")
    void deleteRegisterByStudent(int id_student);

    @SqlQuery("SELECT * FROM registers WHERE id_register = ?")
    @UseRowMapper(RegisterMapper.class)
    Register searchRegisterById(int id_register);

    @SqlUpdate("DELETE FROM registers WHERE id_subject = ?")
    void deleteRegisterBySubject(int id_subject);

}