package com.sanValero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Subject {

     private int id_subject;
    @NonNull private String subject_name;
    @NonNull private String subject_description;
    @NonNull private String subject_year;
    @NonNull private String duration;
    @NonNull private String teacher;
    @NonNull private String image;

}
