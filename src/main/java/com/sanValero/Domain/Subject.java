package com.sanValero.Domain;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Subject {

    private int id_subject;
    @NonNull
    private String subjectName;
    @NonNull
    private String subjectDescription;
    @NonNull
    private String subjectYear;
    @NonNull
    private String duration;
    @NonNull
    private String teacher;
    @NonNull
    private String image;



}
