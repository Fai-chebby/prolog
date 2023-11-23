/* Diseases */
disease(coffee_rust).
disease(coffee_berry).
disease(coffee_wilt).
disease(coffee_bacterial).
disease(coffee_brown_eye_spot).

/* Symptoms */
symptom(brown_spot, yellow_leaves).
symptom(brown_spot, brown_spots_on_leaves).
symptom(brown_spot, leaf_drop).

symptom(coffee_rust, yellow_spots_on_leaves).
symptom(coffee_rust, premature_fruit_drop).
symptom(coffee_rust, defoliation).

symptom(coffee_wilt, wilting_leaves).
symptom(coffee_wilt, discoloration_of_leaves).
symptom(coffee_wilt, dieback_of_branches).

symptom(coffee_bacterial_blight, wilting_of_leaves).
symptom(coffee_bacterial_blight, water_soaked_lesions).
symptom(coffee_bacterial_blight, leaf_necrosis).

/* Causes */
causes(brown_spot, fungus_infection).
causes(coffee_rust, fungus_infection).
causes(coffee_wilt, fusarium_xylarioides).
causes(coffee_bacterial_blight, pseudomonas_syringae).

/* Prevention */
prevention(brown_spot, proper_ventilation).
prevention(brown_spot, regular_pruning).
prevention(brown_spot, fungicide_application).

prevention(coffee_rust, regular_field_inspection).
prevention(coffee_rust, proper_shading).
prevention(coffee_rust, fungicide_spraying).

prevention(coffee_wilt, soil_fumigation).
prevention(coffee_wilt, planting_resistant_varieties).
prevention(coffee_wilt, strict_sanitation_practices).

prevention(coffee_bacterial_blight, copper_based_fungicides).
prevention(coffee_bacterial_blight, pruning_affected_areas).
prevention(coffee_bacterial_blight, crop_rotation).

/* Facts */
berry_color(red).
berry_color(green).
berry_color(yellow).

berry_size(small).
berry_size(medium).
berry_size(large).

berry_type(arabica).
berry_type(robusta).

/* Rules */
is_affected_by(Disease, Plant) :- symptom(Disease, Symptom), affects(Symptom, Plant).
affects(Symptom, coffee_plant) :- symptom(_, Symptom).

has_symptoms(Disease, Symptoms) :- findall(Symptom, symptom(Disease, Symptom), Symptoms).

has_causes(Disease, Causes) :- findall(Cause, causes(Disease, Cause), Causes).

has_preventions(Disease, Preventions) :- findall(Prevention, prevention(Disease, Prevention), Preventions).

is_arabica(Berry) :- berry_type(Berry, arabica).
is_robusta(Berry) :- berry_type(Berry, robusta).

/* Predicate for user query */
get_disease_info :-
    write('Enter the disease: '),
    read(Disease),
    write('Symptoms of '), write(Disease), write(': '),
    has_symptoms(Disease, Symptoms),
    writeln(Symptoms),
    write('Preventions for '), write(Disease), write(': '),
    has_preventions(Disease, Preventions),
    writeln(Preventions).
