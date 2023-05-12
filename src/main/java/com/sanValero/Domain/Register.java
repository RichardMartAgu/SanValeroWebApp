package com.sanValero.Domain;

import java.time.LocalDate;
import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Register {

    private int id_register;
    private Student student;
    private Subject subject;
    @NonNull
    private LocalDate registerDate;




}
