CREATE TABLE t_contest_clarification_responses
(
    response_id                    BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    created_at                     TIMESTAMP WITHOUT TIME ZONE,
    updated_at                     TIMESTAMP WITHOUT TIME ZONE,
    content                        TEXT                                    NOT NULL,
    user_user_id                   BIGINT                                  NOT NULL,
    clarification_clarification_id BIGINT                                  NOT NULL,
    CONSTRAINT pk_t_contest_clarification_responses PRIMARY KEY (response_id)
);

CREATE TABLE t_contest_clarifications
(
    clarification_id   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    created_at         TIMESTAMP WITHOUT TIME ZONE,
    updated_at         TIMESTAMP WITHOUT TIME ZONE,
    title              VARCHAR(255)                            NOT NULL,
    content            TEXT                                    NOT NULL,
    user_user_id       BIGINT                                  NOT NULL,
    contest_contest_id BIGINT                                  NOT NULL,
    sticky             BOOLEAN                                 NOT NULL,
    visible            BOOLEAN                                 NOT NULL,
    contest_problem_id INTEGER,
    CONSTRAINT pk_t_contest_clarifications PRIMARY KEY (clarification_id)
);

CREATE TABLE t_contest_clarifications_responses
(
    responses_response_id                     BIGINT NOT NULL,
    t_contest_clarifications_clarification_id BIGINT NOT NULL
);

CREATE TABLE t_contests_clarifications
(
    clarifications_clarification_id BIGINT NOT NULL,
    t_contests_contest_id           BIGINT NOT NULL
);

ALTER TABLE t_contest_clarifications_responses
    ADD CONSTRAINT uc_t_contest_clarifications_responses_responses_response UNIQUE (responses_response_id);

ALTER TABLE t_contests_clarifications
    ADD CONSTRAINT uc_t_contests_clarifications_clarifications_clarification UNIQUE (clarifications_clarification_id);

ALTER TABLE t_contest_clarification_responses
    ADD CONSTRAINT FK_TCONTESTCLARIFICATIONRESPONSES_ON_CLARIFICATIONCLARIFICATION FOREIGN KEY (clarification_clarification_id) REFERENCES t_contest_clarifications (clarification_id);

ALTER TABLE t_contest_clarifications
    ADD CONSTRAINT FK_T_CONTEST_CLARIFICATIONS_ON_CONTEST_CONTEST FOREIGN KEY (contest_contest_id) REFERENCES t_contests (contest_id);

ALTER TABLE t_contest_clarifications
    ADD CONSTRAINT FK_T_CONTEST_CLARIFICATIONS_ON_USER_USER FOREIGN KEY (user_user_id) REFERENCES t_users (user_id);

ALTER TABLE t_contest_clarification_responses
    ADD CONSTRAINT FK_T_CONTEST_CLARIFICATION_RESPONSES_ON_USER_USER FOREIGN KEY (user_user_id) REFERENCES t_users (user_id);

ALTER TABLE t_contests_clarifications
    ADD CONSTRAINT fk_tconcla_on_contest FOREIGN KEY (t_contests_contest_id) REFERENCES t_contests (contest_id);

ALTER TABLE t_contests_clarifications
    ADD CONSTRAINT fk_tconcla_on_contest_clarification FOREIGN KEY (clarifications_clarification_id) REFERENCES t_contest_clarifications (clarification_id);

ALTER TABLE t_contest_clarifications_responses
    ADD CONSTRAINT fk_tconclares_on_contest_clarification FOREIGN KEY (t_contest_clarifications_clarification_id) REFERENCES t_contest_clarifications (clarification_id);

ALTER TABLE t_contest_clarifications_responses
    ADD CONSTRAINT fk_tconclares_on_contest_clarification_response FOREIGN KEY (responses_response_id) REFERENCES t_contest_clarification_responses (response_id);
