-- Table: quetes.aquete

-- DROP TABLE quetes.aquete;

CREATE TABLE quetes.aquete
(
  aquete_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aquete_cod'::text)::regclass),
  aquete_nom text NOT NULL DEFAULT ''::text, -- Nom de la quête
  aquete_description text NOT NULL DEFAULT ''::text, -- Description/ Info sur la définition de la quête
  aquete_etape_cod integer NOT NULL DEFAULT 0, -- Code de la première mission de la quête.
  aquete_actif character varying DEFAULT 'O'::character varying, -- La quête est accessible.
  aquete_date_debut timestamp with time zone DEFAULT now(), -- la quête ne peut plus être commencée avant cette date (pas de limite si null)
  aquete_date_fin timestamp with time zone, -- la quête ne peut plus être commencée après cette date (pas de limite si null)
  aquete_nb_max_instance integer DEFAULT 1, -- Nombre maximum de fois où la quête peut être faite en parallèle (pas de limite si null)
  aquete_nb_max_participant integer DEFAULT 1, -- Nombre maximum de perso pouvant réaliser la quête ensemble (pas de limite si null)
  aquete_nb_max_rejouable integer DEFAULT 1, -- Nombre de fois où la quête peut-être jouer par un même perso (pas de limite si null)
  aquete_nb_max_quete integer, -- Nombre de fois où la quête peut-être rejouer tous persos confondus (pas de limite si null)
  aquete_max_delai integer, -- Délai maximum alloué (en jours) pour réaliser la quête, au delà de ce délai elle sera terminée en échec (pas de limite si null)
  CONSTRAINT aquete_pkey PRIMARY KEY (aquete_cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete
  OWNER TO delain;
COMMENT ON COLUMN quetes.aquete.aquete_nom IS 'Nom de la quête';
COMMENT ON COLUMN quetes.aquete.aquete_description IS 'Description/ Info sur la définition de la quête';
COMMENT ON COLUMN quetes.aquete.aquete_etape_cod IS 'Code de la première mission de la quête.';
COMMENT ON COLUMN quetes.aquete.aquete_actif IS 'La quête est accessible.';
COMMENT ON COLUMN quetes.aquete.aquete_date_debut IS 'la quête ne peut plus être commencée avant cette date (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_date_fin IS 'la quête ne peut plus être commencée après cette date (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_nb_max_instance IS 'Nombre maximum de fois où la quête peut être faite en parallèle (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_nb_max_participant IS 'Nombre maximum de perso pouvant réaliser la quête ensemble (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_nb_max_rejouable IS 'Nombre de fois où la quête peut-être jouer par un même perso (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_nb_max_quete IS 'Nombre de fois où la quête peut-être rejouer tous persos confondus (pas de limite si null)';
COMMENT ON COLUMN quetes.aquete.aquete_max_delai IS 'Délai maximum alloué (en jours) pour réaliser la quête, au delà de ce délai elle sera terminée en échec (pas de limite si null)';

-- Table: quetes.aquete_element

-- DROP TABLE quetes.aquete_element;

CREATE TABLE quetes.aquete_element
(
  aqelem_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aqelem_cod'::text)::regclass),
  aqelem_aquete_cod integer NOT NULL, -- la quete utilisant cet element
  aqelem_aqetape_cod integer NOT NULL, -- l'étape utilisant cet element
  aqelem_param_id integer NOT NULL, -- N° du paramètre de l'étape pour cet element
  aqelem_type text NOT NULL, -- Type de l'élément: perso, perso_generique, lieu, objet, text, etc...
  aqelem_misc_cod integer, -- lien vers un _cod d'une autre table
  aqelem_param_num_1 numeric, -- Paramètre numeric utilisé en fonction du type de l'element
  aqelem_param_num_2 numeric, -- Paramètre numeric utilisé en fonction du type de l'element
  aqelem_param_num_3 numeric, -- Paramètre numeric utilisé en fonction du type de l'element
  aqelem_param_txt_1 text, -- Paramètre texte utilisé en fonction du type de l'element
  aqelem_param_txt_2 text, -- Paramètre texte utilisé en fonction du type de l'element
  aqelem_param_txt_3 text, -- Paramètre texte utilisé en fonction du type de l'element
  aqelem_param_ordre integer, -- Si un parmètre dispose de plusieurs éléments, ce champ permet de les trier.
  aqelem_aqperso_cod integer, -- C'est la quete du perso à qui rattaché l'élément (null si élément au template quete)
  aqelem_quete_step integer, -- Une même étape peut être realisée plusieurs fois, step est le nombre d''étape faite
  aqelem_nom text, -- Nom de l'élément pour une utilisation texte
  CONSTRAINT aqelem_pkey PRIMARY KEY (aqelem_cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete_element
  OWNER TO delain;
COMMENT ON COLUMN quetes.aquete_element.aqelem_aquete_cod IS 'la quete utilisant cet element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_aqetape_cod IS 'l''étape utilisant cet element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_id IS 'N° du paramètre de l''étape pour cet element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_type IS 'Type de l''élément: perso, perso_generique, lieu, objet, text, etc...';
COMMENT ON COLUMN quetes.aquete_element.aqelem_misc_cod IS 'lien vers un _cod d''une autre table';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_num_1 IS 'Paramètre numeric utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_num_2 IS 'Paramètre numeric utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_num_3 IS 'Paramètre numeric utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_txt_1 IS 'Paramètre texte utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_txt_2 IS 'Paramètre texte utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_txt_3 IS 'Paramètre texte utilisé en fonction du type de l''element';
COMMENT ON COLUMN quetes.aquete_element.aqelem_param_ordre IS 'Si un parmètre dispose de plusieurs éléments, ce champ permet de les trier.';
COMMENT ON COLUMN quetes.aquete_element.aqelem_aqperso_cod IS 'C''est la quete du perso à qui rattaché l''élément (null si élément au template quete)';
COMMENT ON COLUMN quetes.aquete_element.aqelem_quete_step IS 'Une même étape peut être realisée plusieurs fois, step est le nombre d''''étape faite';
COMMENT ON COLUMN quetes.aquete_element.aqelem_nom IS 'Nom de l''élément pour une utilisation texte';

-- Table: quetes.aquete_etape_modele

-- DROP TABLE quetes.aquete_etape_modele;

CREATE TABLE quetes.aquete_etape_modele
(
  aqetapmodel_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aqetapmodel_cod'::text)::regclass),
  aqetapmodel_tag text, -- Pour distinguer l'etapes (1ére étape, etape recompense, etc...)
  aqetapmodel_nom text, -- Nom de l'étape
  aqetapmodel_description text, -- Description/Info sur la définition de l'étape
  aqetapmodel_parametres text, -- Liste des paramètres utilisés séparés par des virgules
  aqetapmodel_param_desc text, -- Définition des paramètres séparés par des |
  aqetapmodel_modele text, -- Suggestion de texte pour l'étape
  CONSTRAINT aqetapmodel_pkey PRIMARY KEY (aqetapmodel_cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete_etape_modele
  OWNER TO delain;
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_tag IS 'Pour distinguer l''etapes (1ére étape, etape recompense, etc...)';
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_nom IS 'Nom de l''étape';
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_description IS 'Description/Info sur la définition de l''étape';
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_parametres IS 'Liste des paramètres utilisés séparés par des virgules';
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_param_desc IS 'Définition des paramètres séparés par des |';
COMMENT ON COLUMN quetes.aquete_etape_modele.aqetapmodel_modele IS 'Suggestion de texte pour l''étape';

-- Table: quetes.aquete_etape

-- DROP TABLE quetes.aquete_etape;

CREATE TABLE quetes.aquete_etape
(
  aqetape_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aqetape_cod'::text)::regclass),
  aqetape_nom text, -- Nom de l'étape
  aqetape_aquete_cod integer, -- De quelle quête cette étape fait partie
  aqetape_aqetapmodel_cod integer, -- Modele de base de l'étape
  aqetape_parametres text, -- Définition des paramètres utilisés pour aqetape_texte
  aqetape_texte text, -- Le texte sera complété avec les paramètres puis sera fourni au perso faisant la quête
  aqetape_etape_cod integer, -- Etape suivante (par défaut), null si dernière etape
  CONSTRAINT aqetape_pkey PRIMARY KEY (aqetape_cod),
  CONSTRAINT fk_aqetape_aqetapmodel_cod FOREIGN KEY (aqetape_aqetapmodel_cod)
      REFERENCES quetes.aquete_etape_modele (aqetapmodel_cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_aqetape_aquete_cod FOREIGN KEY (aqetape_aquete_cod)
      REFERENCES quetes.aquete (aquete_cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete_etape
  OWNER TO delain;
COMMENT ON COLUMN quetes.aquete_etape.aqetape_nom IS 'Nom de l''étape';
COMMENT ON COLUMN quetes.aquete_etape.aqetape_aquete_cod IS 'De quelle quête cette étape fait partie';
COMMENT ON COLUMN quetes.aquete_etape.aqetape_aqetapmodel_cod IS 'Modele de base de l''étape';
COMMENT ON COLUMN quetes.aquete_etape.aqetape_parametres IS 'Définition des paramètres utilisés pour aqetape_texte';
COMMENT ON COLUMN quetes.aquete_etape.aqetape_texte IS 'Le texte sera complété avec les paramètres puis sera fourni au perso faisant la quête';
COMMENT ON COLUMN quetes.aquete_etape.aqetape_etape_cod IS 'Etape suivante (par défaut), null si dernière etape';

-- Table: quetes.aquete_perso

-- DROP TABLE quetes.aquete_perso;

CREATE TABLE quetes.aquete_perso
(
  aqperso_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aqperso_cod'::text)::regclass),
  aqperso_perso_cod integer NOT NULL, -- Le perso
  aqperso_aquete_cod integer NOT NULL, -- La quête
  aqperso_quete_step integer NOT NULL DEFAULT 0, -- Une même étape peut être ralisée plusieurs fois, step est le nombre d'étape faite
  aqperso_etape_cod integer NOT NULL DEFAULT 0, -- Etape en cours de réalisation.
  aqperso_actif character varying NOT NULL DEFAULT 'O'::character varying, -- La quête est en cours de réalisation, sinon abandonnée ou quittée
  aqperso_nb_realisation integer NOT NULL DEFAULT 1, -- Nombre  de fois où la quête a été commencée
  aqperso_nb_termine integer NOT NULL DEFAULT 0, -- Nombre  de fois où la quête a été terminée avec succes
  aqperso_date_debut timestamp with time zone DEFAULT now(), -- Derniere date de démarrage de la quête
  aqperso_date_fin timestamp with time zone, -- Derniere date de fin de la quête
  aqperso_date_debut_etape timestamp with time zone DEFAULT now(),
  CONSTRAINT aquete_perso_pkey PRIMARY KEY (aqperso_cod),
  CONSTRAINT aqperso_perso_cod FOREIGN KEY (aqperso_perso_cod)
      REFERENCES public.perso (perso_cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_aqperso_aquete_cod FOREIGN KEY (aqperso_aquete_cod)
      REFERENCES quetes.aquete (aquete_cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete_perso
  OWNER TO webdelain;
COMMENT ON COLUMN quetes.aquete_perso.aqperso_perso_cod IS 'Le perso';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_aquete_cod IS 'La quête';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_quete_step IS 'Une même étape peut être ralisée plusieurs fois, step est le nombre d''étape faite';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_etape_cod IS 'Etape en cours de réalisation.';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_actif IS 'La quête est en cours de réalisation, sinon abandonnée ou quittée';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_nb_realisation IS 'Nombre  de fois où la quête a été commencée';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_nb_termine IS 'Nombre  de fois où la quête a été terminée avec succes';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_date_debut IS 'Derniere date de démarrage de la quête';
COMMENT ON COLUMN quetes.aquete_perso.aqperso_date_fin IS 'Derniere date de fin de la quête';


-- Index: quetes.fki_aqperso_perso_cod

-- DROP INDEX quetes.fki_aqperso_perso_cod;

CREATE INDEX fki_aqperso_perso_cod
  ON quetes.aquete_perso
  USING btree
  (aqperso_perso_cod);

-- Table: quetes.aquete_perso_journal

-- DROP TABLE quetes.aquete_perso_journal;

CREATE TABLE quetes.aquete_perso_journal
(
  aqpersoj_cod integer NOT NULL DEFAULT nextval(('quetes.seq_aqpersoj_cod'::text)::regclass),
  aqpersoj_date timestamp with time zone DEFAULT now(), -- La date de l'evenement
  aqpersoj_aqperso_cod integer NOT NULL, -- La quete du perso
  aqpersoj_realisation integer NOT NULL, -- N° de realisation (la même quete peut être est faite plusieurs fois)
  aqpersoj_quete_step integer NOT NULL DEFAULT 0, -- le step
  aqpersoj_texte text, -- le texte dans le journal
  aqpersoj_lu character varying(1) NOT NULL DEFAULT 'N'::character varying, -- Est-ce que cette page du journal a été lu (O ou N)  ?
  CONSTRAINT aquete_perso_journal_pkey PRIMARY KEY (aqpersoj_cod),
  CONSTRAINT fk_aqpersoj_aqperso_cod FOREIGN KEY (aqpersoj_aqperso_cod)
      REFERENCES quetes.aquete_perso (aqperso_cod) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE quetes.aquete_perso_journal
  OWNER TO webdelain;
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_date IS 'La date de l''evenement';
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_aqperso_cod IS 'La quete du perso';
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_realisation IS 'N° de realisation (la même quete peut être est faite plusieurs fois)';
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_quete_step IS 'le step';
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_texte IS 'le texte dans le journal';
COMMENT ON COLUMN quetes.aquete_perso_journal.aqpersoj_lu IS 'Est-ce que cette page du journal a été lu (O ou N)  ?';


CREATE SEQUENCE quetes.seq_aquete_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aquete_cod
  OWNER TO webdelain;

CREATE SEQUENCE quetes.seq_aqelem_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aqelem_cod
  OWNER TO webdelain;

CREATE SEQUENCE quetes.seq_aqetape_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aqetape_cod
  OWNER TO webdelain;


CREATE SEQUENCE quetes.seq_aqetapmodel_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aqetapmodel_cod
  OWNER TO webdelain;

CREATE SEQUENCE quetes.seq_aqperso_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aqperso_cod
  OWNER TO webdelain;

CREATE SEQUENCE quetes.seq_aqpersoj_cod
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE quetes.seq_aqpersoj_cod
  OWNER TO webdelain;

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#START', 'Quête - Déclenchement sur perso', 'Cette étape ne doit être utilisée qu''en tant que 1ère étape d''une quête. Elle permet de déterminer quel personnage va déclencher la quête.',
            '[1:perso|1%0],[2:choix|2%2]',
            'Liste des persos (pnj) qui permettent de démarrer la quête.|Liste de deux choix pour soit accepter (saisir 0 comme n° d''étape) la quête, soit la refuser (saisir -1).',
            'Vous abordez [1], après quelques échanges de courtoisie, il vous propose: [2]');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#START', 'Quête - Déclenchement sur lieu', 'Cette étape ne doit être utilisée qu''en tant que 1ère étape d''une quête. Elle permet de déterminer quels lieux vont déclencher la quête.',
            '[1:lieu|1%0],[2:choix|2%2]',
            'Liste des lieux qui permettent de démarrer la quête.|Liste de deux choix pour soit accepter (saisir 0 comme n° d''étape) la quête, soit la refuser (saisir -1).',
            'Cet établissement recherche les services d''un aventurier pour une mission, l''acceptez vous? [2]');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#START', 'Quête - Déclenchement sur type de lieu', 'Cette étape ne doit être utilisée qu''en tant que 1ère étape d''une quête. Elle permet de déterminer quels type de lieux vont déclencher la quête.',
            '[1:lieu_type|1%0],[2:choix|2%2]',
            'Liste des lieux qui permettent de démarrer la quête.|Liste de deux choix pour soit accepter (saisir 0 comme n° d''étape) la quête, soit la refuser (saisir -1).',
            'Cet établissement recherche les services d''un aventurier pour une mission, l''acceptez vous? [2]');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MOVE #PERSO', 'Déplacement - Vers un PERSO', 'Dans cette étape on demande à l''aventurier d''aller voir un PNJ.',
           '[1:delai|1%1],[2:perso|1%0]',
           'Délai alloué pour cette étape.|C''est le PNJ à que l''aventurier doit aller voir',
           'Allez donner de mes nouvelles à mon ami [2].');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MOVE #LIEU', 'Déplacement - Vers un LIEU', 'Dans cette étape on demande à l''aventurier de se rendre dans un lieu.',
           '[1:delai|1%1],[2:lieu|1%0]',
           'Délai alloué pour cette étape.|C''est le lieu que l''aventurier doit aller voir',
           'Rendez-vous à [2].');

 INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MOVE #TYPELIEU', 'Déplacement - Vers un Type de LIEU', 'Dans cette étape on demande à l''aventurier de se rendre dans un type de lieu.',
           '[1:delai|1%1],[2:lieu_type|1%0]',
           'Délai alloué pour cette étape.|C''est le type de lieu dans lequel l''aventurier doit se rendre',
           'Rendez-vous à [2].');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#TEXTE', 'Quête - Afficher du TEXTE (RP)', 'Cette étape est automatiquement validée, elle sert à jouter du contenu texte dans le déroulement de la quête. (il n''y a pas de paramètre)',
           NULL,
           NULL,
           NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#CHOIX', 'Quête - Faire un CHOIX', 'Dans cette étape on demande à l''aventurier de faire un choix, l''étape suivante dépend alors du choix.',
           '[1:choix|0%0]',
           'Ce sont les choix fait à l''aventurier, il faut assossier chaque choix à une étape pour pousuivre la quête.',
           'Faite votre choix?');


INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#END #OK', 'Quête - Fin de la quête avec SUCCES', 'Cette étape doit être utilisée pour mettre fin à la quête sur une réussite.',
            NULL,
            NULL,
            'Bravo, vous avez terminé cette quête avec succès.');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#END #KO', 'Quête - Fin de la quête sur ECHEC', 'Cette étape doit être utilisée pour mettre fin à la quête sur un échec.',
            NULL,
            NULL,
            'Dommage, vous n''avez pas réussie cette quête.');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#SAUT', 'Quête - Aller à l''ETAPE', 'Cette étape sert faire un saut sans condition vers une autre étape, il n''est pas necessaire de mettre du texte d''étape',
           '[1:etape|1%1]',
           'C''est l''étape de destination souhaitée.',
            NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#RECEVOIR #PX', 'Gain - Recevoir PX/PO', 'Cette étape sert à attribuer des récompenses en PX/PO  au personnage réalisant la quête.',
           '[1:valeur|1%1|px],[2:valeur|1%1|po],[3:perso|0%1]',
           'Gain de PX|Gain de Brouzoufs|Ce paramètre est facultatif, s''il est défini, les dons de PO/PX seront de sa part.',
            '[3] vous récompenses de vos efforts, vous recevez [1] PX et [2] Brouzoufs.');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#RECEVOIR #TITRE', 'Gain - Recevoir un TITRE', 'Cette étape sert à attribuer un titre au personnage réalisant la quête',
           '[1:texte|1%1|Titre]',
           'C''est le titre qui sera donné au joueur en récompense.',
            'En récompenses de vos efforts, vous recevez le titre de:<br>  [1].');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#RECEVOIR #OBJET', 'Objets - Recevoir un objet d''un PNJ', 'Cette étape sert à récuperer des objets de la part d''un PNJ. Cela peut-être des cadeaux que le joueur pourra garder, ou quelque chose qu''il devra utiliser dans une autre etape de la quête',
           '[1:delai|1%1],[2:perso|1%1],[3:valeur|1%1],[4:objet_generique|0%0]',
           'Délai alloué pour cette étape.|C''est le PNJ qui donne les objets|C''est le nombre d''objet à donner, si ce nombre est inférieur au nombre de générique alors un tirage aléatoire sera effectué, s''il est superieur alors le joueur recevra au moins un exemplaire de chaque puis un complément aléatoire pour atteidre le nombre prévu.|Ce sont les génériques qui serviront de modèle aux objets qui seront donné.',
            '[2] souhaite vous donner [3] objets parmi: [4].');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#REMETTRE #OBJET', 'Objets - Remettre un objet à un PNJ ', 'Cette étape sert à donner un objet à un PNJ (nota: les objets doivent être donnés sous forme de transaction avec un prix de vente à 0 bz).',
           '[1:delai|1%1],[2:perso|1%1],[3:valeur|1%1],[4:objet_generique|0%0]',
           'Délai alloué pour cette étape.|C''est le PNJ à qui l''aventurier doit remettre l''objet|C''est le nombre d''objet attendu, si le nombre est superieur au nombre de générique alors le joueur devra donner autant d''objet mais avec au moins un exemplaire de chaque. |Ce sont les génériques des objets que le PNJ s''attend à recevoir.',
           '[2] attend que vous lui remettiez [3] objets parmi: [4].');

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#NETTOYAGE', 'Quête - Nettoyer la quête', 'Cette étape sert à supprimer des éléments qui ont été utilisés pendant la quête et qui ne reserviront plus. Si une quête peut-être réalisée plusieurs fois par plusieurs aventuriers différents, pour ne pas laisser les objets créé s''accumuler, on fait le nettoyage. Nota: cette étape est automatiquement réussie, aussi vous pouvez laisser le texte d''étape vide.',
           '[1:element|0%0]',
           'C''est la liste des élements qui ont été utilisés pendant la quête et qui ne doivent plus servir. Ces objets, pnj ou monstres seront supprimés de la base de données',
           NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MONSTRE #POSITION', 'Monstres - Invoquer des Monstres ou PNJ sur une position', 'Cette étape sert à invoquer des monstres, un Boss ou simplement un PNJ à proximité d''une position donnée.',
           '[1:valeur|1%1],[2:position|1%1],[3:valeur|1%1],[4:monstre_generique|0%0]',
           'C''est le nombre de monstre à invoquer, si ce nombre est inférieur au nombre de générique alors un tirage aléatoire sera effectué, s''il est superieur alors il y aura une invocation de chaque puis un complément aléatoire pour atteidre le nombre prévu.' ||
           '|C''est la position centrale où seront invoqué les monstres.' ||
           '|C''est la dispersion. Les monstres seront invoqués autour du point ciblé, dans un rayon inférieur à cette valeur.' ||
           '|Ce sont les génériques des monstres à invoquer.',
           NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MONSTRE #PERSO', 'Monstres - Invoquer des Monstres ou PNJ sur un perso', 'Cette étape sert à invoquer des monstres, un Boss ou simplement un PNJ à proximité d''un perso.',
           '[1:valeur|1%1],[2:perso|1%1],[3:valeur|1%1],[4:monstre_generique|0%0]',
           'C''est le nombre de monstre à invoquer, si ce nombre est inférieur au nombre de générique alors un tirage aléatoire sera effectué, s''il est superieur alors il y aura une invocation de chaque puis un complément aléatoire pour atteidre le nombre prévu.' ||
           '|C''est le perso autour duquel  les monstres seront invoqués, laisser à zéro pour faire l''invocation autour du perso qui fait la quête.' ||
           '|C''est la dispersion. Les monstres seront invoqués autour du point ciblé, dans un rayon inférieur à cette valeur.' ||
           '|Ce sont les génériques des monstres à invoquer.',
           NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#MONSTRE #ARMEE', 'Monstres - Invoquer une armée de Monstres', 'Cette étape sert à invoquer une armée de monstre à proximité d''un perso, le type de monstre invoqué sera pris en suivant la répartition spécifique de l''étage',
           '[1:valeur|1%1],[2:perso|1%1],[3:valeur|1%1],[4:perso]',
           'C''est le nombre de monstre à invoquer.' ||
           '|C''est le perso autour duquel  les monstres seront invoqués, laisser à zéro pour faire l''invocation autour du perso qui fait la quête.' ||
           '|C''est la dispersion. Les monstres seront invoqués autour du point ciblé, dans un rayon inférieur à cette valeur.' ||
           '|Ce paramètre n''est pas éditable mais mais il peut être utilisé dans le reste de la quête par référence, il contiendra la liste des monstres qui auront été invoqués.',
           NULL);

INSERT INTO quetes.aquete_etape_modele(
            aqetapmodel_tag, aqetapmodel_nom, aqetapmodel_description,
            aqetapmodel_parametres, aqetapmodel_param_desc, aqetapmodel_modele)
    VALUES ('#TUER #PERSO', 'Tuer - Tuer des Monstres ou PNJ', 'Dans cette étape on demande au joueur de tuer un ou plusieurs persos.',
           '[1:delai|1%1],[2:perso|0%0],[3:valeur|1%1],[4:etape|1%1]',
           'Délai alloué pour cette étape.' ||
           '|C''est la liste du ou des persos à tuer.' ||
           '|Vous pouvez choisir si le joueur doit être le tueur lui-même, ou si la mort par d''autres aventurier est suffisante. Indiquez ici, le nombre de montre que le joueur doit avoir achevé par lui-même.' ||
           '|C''est l''étape vers laquelle sera envoyée le joueur si celle-ci echoue. En fonction des paramètres, l''étape actuelle peut échouer si le joueur n''a pas pas achevé son nombre cible prevue (vous pouvez saisir -3, pour mettre fin à la quête sur un echec). En cas de réussite, la quête passera à l''étape suivante.',
           'Liberez nous du joug de [2], achevez-en au moins [3] monstres par vous même.');

