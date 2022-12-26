PGDMP     
    4                z         
   mydbuddydb    14.5    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24607 
   mydbuddydb    DATABASE     �   CREATE DATABASE mydbuddydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE mydbuddydb;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    24945    bot_analytics    TABLE     M  CREATE TABLE public.bot_analytics (
    "botId" character varying(255) NOT NULL,
    date date DEFAULT date(now()) NOT NULL,
    channel character varying(255) NOT NULL,
    metric character varying(255) NOT NULL,
    "subMetric" character varying(255) DEFAULT ''::character varying NOT NULL,
    value integer DEFAULT 0 NOT NULL
);
 !   DROP TABLE public.bot_analytics;
       public         heap    postgres    false    4            �            1259    24916    bot_chat_users    TABLE       CREATE TABLE public.bot_chat_users (
    "botId" character varying(255) NOT NULL,
    channel character varying(255) NOT NULL,
    "userId" character varying(255) NOT NULL,
    "createdOn" date DEFAULT date(now()) NOT NULL,
    "lastSeenOn" date DEFAULT date(now()) NOT NULL
);
 "   DROP TABLE public.bot_chat_users;
       public         heap    postgres    false    4            �            1259    24977    comments    TABLE     3  CREATE TABLE public.comments (
    id integer NOT NULL,
    "handoffId" integer NOT NULL,
    "threadId" character varying(255) NOT NULL,
    "agentId" character varying(255) NOT NULL,
    content text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false    4            �            1259    24976    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public          postgres    false    234    4            �           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public          postgres    false    233            �            1259    24888    data_retention    TABLE     �   CREATE TABLE public.data_retention (
    channel text NOT NULL,
    user_id text NOT NULL,
    field_path text NOT NULL,
    expiry_date timestamp with time zone NOT NULL,
    created_on timestamp with time zone NOT NULL
);
 "   DROP TABLE public.data_retention;
       public         heap    postgres    false    4            �            1259    24860    dialog_sessions    TABLE     U  CREATE TABLE public.dialog_sessions (
    id text NOT NULL,
    context json NOT NULL,
    temp_data json NOT NULL,
    session_data json NOT NULL,
    context_expiry timestamp with time zone,
    session_expiry timestamp with time zone,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL
);
 #   DROP TABLE public.dialog_sessions;
       public         heap    postgres    false    4                       1259    25404    dlsl_info_faq    TABLE     ,  CREATE TABLE public.dlsl_info_faq (
    "ID" text NOT NULL,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link/Response" text
);
 !   DROP TABLE public.dlsl_info_faq;
       public         heap    postgres    false    4            �            1259    24898    events    TABLE     G  CREATE TABLE public.events (
    id character varying(255) NOT NULL,
    "messageId" uuid,
    "botId" character varying(255) NOT NULL,
    channel character varying(255) NOT NULL,
    "threadId" character varying(255),
    target character varying(255),
    "sessionId" character varying(255),
    type character varying(255),
    direction character varying(255) NOT NULL,
    "incomingEventId" character varying(255),
    "workflowId" character varying(255),
    feedback integer,
    success boolean,
    event json NOT NULL,
    "createdOn" timestamp with time zone NOT NULL
);
    DROP TABLE public.events;
       public         heap    postgres    false    4            �            1259    24965    handoffs    TABLE     E  CREATE TABLE public.handoffs (
    id integer NOT NULL,
    "botId" character varying(255) NOT NULL,
    "userId" character varying(255) NOT NULL,
    "agentId" character varying(255),
    "userThreadId" character varying(255) NOT NULL,
    "userChannel" character varying(255) NOT NULL,
    "agentThreadId" character varying(255),
    status character varying(255) NOT NULL,
    tags json,
    "assignedAt" timestamp with time zone,
    "resolvedAt" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.handoffs;
       public         heap    postgres    false    4            �            1259    24964    handoffs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.handoffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.handoffs_id_seq;
       public          postgres    false    232    4            �           0    0    handoffs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.handoffs_id_seq OWNED BY public.handoffs.id;
          public          postgres    false    231            �            1259    25007    misunderstood    TABLE     t  CREATE TABLE public.misunderstood (
    id integer NOT NULL,
    "eventId" character varying(255),
    "botId" character varying(255),
    language character varying(255),
    preview text,
    reason text,
    status text DEFAULT 'new'::text,
    "resolutionType" text,
    resolution character varying(255),
    "resolutionParams" json,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT misunderstood_reason_check CHECK ((reason = ANY (ARRAY['auto_hook'::text, 'action'::text, 'manual'::text, 'thumbs_down'::text]))),
    CONSTRAINT "misunderstood_resolutionType_check" CHECK (("resolutionType" = ANY (ARRAY['qna'::text, 'intent'::text]))),
    CONSTRAINT misunderstood_status_check CHECK ((status = ANY (ARRAY['new'::text, 'applied'::text, 'deleted'::text, 'pending'::text])))
);
 !   DROP TABLE public.misunderstood;
       public         heap    postgres    false    4            �            1259    25006    misunderstood_id_seq    SEQUENCE     �   CREATE SEQUENCE public.misunderstood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.misunderstood_id_seq;
       public          postgres    false    238    4            �           0    0    misunderstood_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.misunderstood_id_seq OWNED BY public.misunderstood.id;
          public          postgres    false    237            �            1259    25021    model_entry    TABLE       CREATE TABLE public.model_entry (
    "botId" character varying(255) NOT NULL,
    language character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    "modelId" character varying(255) NOT NULL,
    "definitionHash" character varying(255) NOT NULL
);
    DROP TABLE public.model_entry;
       public         heap    postgres    false    4            �            1259    25059    msg_channels    TABLE     �   CREATE TABLE public.msg_channels (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    lazy boolean NOT NULL,
    initiable boolean NOT NULL
);
     DROP TABLE public.msg_channels;
       public         heap    postgres    false    4            �            1259    25049    msg_client_tokens    TABLE     �   CREATE TABLE public.msg_client_tokens (
    id uuid NOT NULL,
    "clientId" uuid,
    token character varying(255) NOT NULL,
    expiry timestamp with time zone
);
 %   DROP TABLE public.msg_client_tokens;
       public         heap    postgres    false    4            �            1259    25044    msg_clients    TABLE     :   CREATE TABLE public.msg_clients (
    id uuid NOT NULL
);
    DROP TABLE public.msg_clients;
       public         heap    postgres    false    4            �            1259    25096    msg_conduits    TABLE     �   CREATE TABLE public.msg_conduits (
    id uuid NOT NULL,
    "providerId" uuid NOT NULL,
    "channelId" uuid NOT NULL,
    config text NOT NULL
);
     DROP TABLE public.msg_conduits;
       public         heap    postgres    false    4            �            1259    25136    msg_conversations    TABLE     �   CREATE TABLE public.msg_conversations (
    id uuid NOT NULL,
    "clientId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "createdOn" timestamp with time zone NOT NULL
);
 %   DROP TABLE public.msg_conversations;
       public         heap    postgres    false    4                       1259    25247    msg_convmap    TABLE     �   CREATE TABLE public.msg_convmap (
    "tunnelId" uuid NOT NULL,
    "conversationId" uuid NOT NULL,
    "threadId" uuid NOT NULL
);
    DROP TABLE public.msg_convmap;
       public         heap    postgres    false    4                       1259    25299 
   msg_health    TABLE     �   CREATE TABLE public.msg_health (
    id uuid NOT NULL,
    "conduitId" uuid NOT NULL,
    "time" timestamp with time zone NOT NULL,
    type character varying(255) NOT NULL,
    data jsonb
);
    DROP TABLE public.msg_health;
       public         heap    postgres    false    4            �            1259    25189    msg_identities    TABLE     �   CREATE TABLE public.msg_identities (
    id uuid NOT NULL,
    "tunnelId" uuid NOT NULL,
    name character varying(255) NOT NULL
);
 "   DROP TABLE public.msg_identities;
       public         heap    postgres    false    4            �            1259    25035    msg_kvs    TABLE     y   CREATE TABLE public.msg_kvs (
    id uuid NOT NULL,
    key character varying(255) NOT NULL,
    value jsonb NOT NULL
);
    DROP TABLE public.msg_kvs;
       public         heap    postgres    false    4            �            1259    25152    msg_messages    TABLE     �   CREATE TABLE public.msg_messages (
    id uuid NOT NULL,
    "conversationId" uuid NOT NULL,
    "authorId" uuid,
    "sentOn" timestamp with time zone NOT NULL,
    payload jsonb NOT NULL
);
     DROP TABLE public.msg_messages;
       public         heap    postgres    false    4            �            1259    25028    msg_meta    TABLE     _   CREATE TABLE public.msg_meta (
    "time" timestamp with time zone NOT NULL,
    data jsonb
);
    DROP TABLE public.msg_meta;
       public         heap    postgres    false    4            �            1259    25068    msg_providers    TABLE     �   CREATE TABLE public.msg_providers (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    sandbox boolean NOT NULL
);
 !   DROP TABLE public.msg_providers;
       public         heap    postgres    false    4            �            1259    25075    msg_provisions    TABLE     e   CREATE TABLE public.msg_provisions (
    "clientId" uuid NOT NULL,
    "providerId" uuid NOT NULL
);
 "   DROP TABLE public.msg_provisions;
       public         heap    postgres    false    4                       1259    25269    msg_sandboxmap    TABLE     �   CREATE TABLE public.msg_sandboxmap (
    "conduitId" uuid NOT NULL,
    identity character varying(255) NOT NULL,
    sender character varying(255) NOT NULL,
    thread character varying(255) NOT NULL,
    "clientId" uuid NOT NULL
);
 "   DROP TABLE public.msg_sandboxmap;
       public         heap    postgres    false    4            �            1259    25201    msg_senders    TABLE     �   CREATE TABLE public.msg_senders (
    id uuid NOT NULL,
    "identityId" uuid NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.msg_senders;
       public         heap    postgres    false    4                       1259    25286 
   msg_status    TABLE     �   CREATE TABLE public.msg_status (
    "conduitId" uuid NOT NULL,
    "numberOfErrors" integer NOT NULL,
    "initializedOn" timestamp with time zone,
    "lastError" text
);
    DROP TABLE public.msg_status;
       public         heap    postgres    false    4                        1259    25213    msg_threads    TABLE     �   CREATE TABLE public.msg_threads (
    id uuid NOT NULL,
    "senderId" uuid NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.msg_threads;
       public         heap    postgres    false    4            �            1259    25170    msg_tunnels    TABLE     �   CREATE TABLE public.msg_tunnels (
    id uuid NOT NULL,
    "clientId" uuid NOT NULL,
    "channelId" uuid,
    "customChannelName" character varying(255)
);
    DROP TABLE public.msg_tunnels;
       public         heap    postgres    false    4            �            1259    25126    msg_user_tokens    TABLE     �   CREATE TABLE public.msg_user_tokens (
    id uuid NOT NULL,
    "userId" uuid,
    token character varying(255) NOT NULL,
    expiry timestamp with time zone
);
 #   DROP TABLE public.msg_user_tokens;
       public         heap    postgres    false    4                       1259    25225    msg_usermap    TABLE     |   CREATE TABLE public.msg_usermap (
    "tunnelId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "senderId" uuid NOT NULL
);
    DROP TABLE public.msg_usermap;
       public         heap    postgres    false    4            �            1259    25116 	   msg_users    TABLE     V   CREATE TABLE public.msg_users (
    id uuid NOT NULL,
    "clientId" uuid NOT NULL
);
    DROP TABLE public.msg_users;
       public         heap    postgres    false    4            �            1259    25084    msg_webhooks    TABLE     �   CREATE TABLE public.msg_webhooks (
    id uuid NOT NULL,
    "clientId" uuid NOT NULL,
    url character varying(255) NOT NULL,
    token character varying(255) NOT NULL
);
     DROP TABLE public.msg_webhooks;
       public         heap    postgres    false    4                       1259    25398    mydcampus_info_faq    TABLE     1  CREATE TABLE public.mydcampus_info_faq (
    "ID" text NOT NULL,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link/Response" text
);
 &   DROP TABLE public.mydcampus_info_faq;
       public         heap    postgres    false    4                       1259    25325    mydcampus_issues_faq    TABLE     3  CREATE TABLE public.mydcampus_issues_faq (
    "ID" text NOT NULL,
    "General Choice" text,
    "Choice Gen Info/Issue" text,
    "Feature Choice" text,
    "MyDCampus/DLSL Option " text,
    "Category" text,
    "Question / Inquiry / Solution / Information Description" text,
    "Link/Response" text
);
 (   DROP TABLE public.mydcampus_issues_faq;
       public         heap    postgres    false    4            �            1259    24831    srv_channel_users    TABLE     8  CREATE TABLE public.srv_channel_users (
    id integer NOT NULL,
    channel character varying(255),
    user_id character varying(255),
    attributes json,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 %   DROP TABLE public.srv_channel_users;
       public         heap    postgres    false    4            �            1259    24830    srv_channel_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.srv_channel_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.srv_channel_users_id_seq;
       public          postgres    false    212    4            �           0    0    srv_channel_users_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.srv_channel_users_id_seq OWNED BY public.srv_channel_users.id;
          public          postgres    false    211            �            1259    24936    srv_channels    TABLE     �   CREATE TABLE public.srv_channels (
    "clientId" uuid NOT NULL,
    "botId" character varying(255) NOT NULL,
    "clientToken" character varying(255) NOT NULL,
    config jsonb NOT NULL
);
     DROP TABLE public.srv_channels;
       public         heap    postgres    false    4            �            1259    24867    srv_ghost_files    TABLE     �   CREATE TABLE public.srv_ghost_files (
    file_path character varying(255) NOT NULL,
    content bytea,
    deleted boolean,
    modified_on timestamp with time zone
);
 #   DROP TABLE public.srv_ghost_files;
       public         heap    postgres    false    4            �            1259    24874    srv_ghost_index    TABLE     �   CREATE TABLE public.srv_ghost_index (
    file_path character varying(255) NOT NULL,
    revision character varying(255) NOT NULL,
    created_by character varying(255),
    created_on timestamp with time zone
);
 #   DROP TABLE public.srv_ghost_index;
       public         heap    postgres    false    4            �            1259    24881    srv_kvs    TABLE     �   CREATE TABLE public.srv_kvs (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "botId" character varying(255) NOT NULL,
    "expireOn" timestamp with time zone,
    modified_on timestamp with time zone
);
    DROP TABLE public.srv_kvs;
       public         heap    postgres    false    4            �            1259    24854    srv_logs    TABLE     �   CREATE TABLE public.srv_logs (
    "botId" character varying(255),
    hostname character varying(255),
    "timestamp" timestamp with time zone,
    level character varying(255),
    scope character varying(255),
    message text,
    metadata text
);
    DROP TABLE public.srv_logs;
       public         heap    postgres    false    4            �            1259    24825    srv_metadata    TABLE     �   CREATE TABLE public.srv_metadata (
    server_version character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
     DROP TABLE public.srv_metadata;
       public         heap    postgres    false    4            �            1259    24926    srv_migrations    TABLE     C  CREATE TABLE public.srv_migrations (
    id integer NOT NULL,
    "initialVersion" character varying(255),
    "targetVersion" character varying(255),
    details text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 "   DROP TABLE public.srv_migrations;
       public         heap    postgres    false    4            �            1259    24925    srv_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.srv_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.srv_migrations_id_seq;
       public          postgres    false    227    4            �           0    0    srv_migrations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.srv_migrations_id_seq OWNED BY public.srv_migrations.id;
          public          postgres    false    226            �            1259    24995    strategy_default    TABLE     �  CREATE TABLE public.strategy_default (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255),
    salt character varying(255),
    strategy character varying(255) NOT NULL,
    attributes json NOT NULL,
    "tokenVersion" integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 $   DROP TABLE public.strategy_default;
       public         heap    postgres    false    4            �            1259    24994    strategy_default_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strategy_default_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.strategy_default_id_seq;
       public          postgres    false    236    4            �           0    0    strategy_default_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.strategy_default_id_seq OWNED BY public.strategy_default.id;
          public          postgres    false    235            �            1259    24908    tasks    TABLE     �  CREATE TABLE public.tasks (
    id integer NOT NULL,
    "eventId" character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    "actionName" character varying(255) NOT NULL,
    "actionArgs" json NOT NULL,
    "actionServerId" character varying(255) NOT NULL,
    "statusCode" integer,
    "startedAt" timestamp with time zone NOT NULL,
    "endedAt" timestamp with time zone NOT NULL,
    "failureReason" character varying(255)
);
    DROP TABLE public.tasks;
       public         heap    postgres    false    4            �            1259    24907    tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    224    4            �           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    223            �            1259    24665 	   tbl_users    TABLE     u   CREATE TABLE public.tbl_users (
    fld_email text NOT NULL,
    fld_password text,
    fld_if_first_time boolean
);
    DROP TABLE public.tbl_users;
       public         heap    postgres    false    4            �            1259    24893 	   telemetry    TABLE     �   CREATE TABLE public.telemetry (
    uuid uuid NOT NULL,
    payload json NOT NULL,
    available boolean NOT NULL,
    "lastChanged" timestamp with time zone NOT NULL,
    "creationDate" timestamp with time zone NOT NULL
);
    DROP TABLE public.telemetry;
       public         heap    postgres    false    4            �            1259    24955    web_user_map    TABLE     �   CREATE TABLE public.web_user_map (
    "botId" character varying(255) NOT NULL,
    "visitorId" character varying(255) NOT NULL,
    "userId" uuid
);
     DROP TABLE public.web_user_map;
       public         heap    postgres    false    4            �            1259    24847    workspace_invite_codes    TABLE     7  CREATE TABLE public.workspace_invite_codes (
    "workspaceId" character varying(255),
    "inviteCode" character varying(255),
    "allowedUsages" integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 *   DROP TABLE public.workspace_invite_codes;
       public         heap    postgres    false    4            �            1259    24842    workspace_users    TABLE     �   CREATE TABLE public.workspace_users (
    email character varying(255),
    strategy character varying(255),
    workspace character varying(255),
    role character varying(255)
);
 #   DROP TABLE public.workspace_users;
       public         heap    postgres    false    4            3           2604    24980    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            2           2604    24968    handoffs id    DEFAULT     j   ALTER TABLE ONLY public.handoffs ALTER COLUMN id SET DEFAULT nextval('public.handoffs_id_seq'::regclass);
 :   ALTER TABLE public.handoffs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            8           2604    25010    misunderstood id    DEFAULT     t   ALTER TABLE ONLY public.misunderstood ALTER COLUMN id SET DEFAULT nextval('public.misunderstood_id_seq'::regclass);
 ?   ALTER TABLE public.misunderstood ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            $           2604    24834    srv_channel_users id    DEFAULT     |   ALTER TABLE ONLY public.srv_channel_users ALTER COLUMN id SET DEFAULT nextval('public.srv_channel_users_id_seq'::regclass);
 C   ALTER TABLE public.srv_channel_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ,           2604    24929    srv_migrations id    DEFAULT     v   ALTER TABLE ONLY public.srv_migrations ALTER COLUMN id SET DEFAULT nextval('public.srv_migrations_id_seq'::regclass);
 @   ALTER TABLE public.srv_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            4           2604    24998    strategy_default id    DEFAULT     z   ALTER TABLE ONLY public.strategy_default ALTER COLUMN id SET DEFAULT nextval('public.strategy_default_id_seq'::regclass);
 B   ALTER TABLE public.strategy_default ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            )           2604    24911    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            |          0    24945    bot_analytics 
   TABLE DATA           [   COPY public.bot_analytics ("botId", date, channel, metric, "subMetric", value) FROM stdin;
    public          postgres    false    229   .      x          0    24916    bot_chat_users 
   TABLE DATA           _   COPY public.bot_chat_users ("botId", channel, "userId", "createdOn", "lastSeenOn") FROM stdin;
    public          postgres    false    225   �.      �          0    24977    comments 
   TABLE DATA           m   COPY public.comments (id, "handoffId", "threadId", "agentId", content, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    234   (/      s          0    24888    data_retention 
   TABLE DATA           _   COPY public.data_retention (channel, user_id, field_path, expiry_date, created_on) FROM stdin;
    public          postgres    false    220   E/      o          0    24860    dialog_sessions 
   TABLE DATA           �   COPY public.dialog_sessions (id, context, temp_data, session_data, context_expiry, session_expiry, created_on, modified_on) FROM stdin;
    public          postgres    false    216   b/      �          0    25404    dlsl_info_faq 
   TABLE DATA           �   COPY public.dlsl_info_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link/Response") FROM stdin;
    public          postgres    false    264   /      u          0    24898    events 
   TABLE DATA           �   COPY public.events (id, "messageId", "botId", channel, "threadId", target, "sessionId", type, direction, "incomingEventId", "workflowId", feedback, success, event, "createdOn") FROM stdin;
    public          postgres    false    222   ;                0    24965    handoffs 
   TABLE DATA           �   COPY public.handoffs (id, "botId", "userId", "agentId", "userThreadId", "userChannel", "agentThreadId", status, tags, "assignedAt", "resolvedAt", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    232   6�      �          0    25007    misunderstood 
   TABLE DATA           �   COPY public.misunderstood (id, "eventId", "botId", language, preview, reason, status, "resolutionType", resolution, "resolutionParams", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    238   S�      �          0    25021    model_entry 
   TABLE DATA           ]   COPY public.model_entry ("botId", language, status, "modelId", "definitionHash") FROM stdin;
    public          postgres    false    239   �      �          0    25059    msg_channels 
   TABLE DATA           J   COPY public.msg_channels (id, name, version, lazy, initiable) FROM stdin;
    public          postgres    false    244   0�      �          0    25049    msg_client_tokens 
   TABLE DATA           J   COPY public.msg_client_tokens (id, "clientId", token, expiry) FROM stdin;
    public          postgres    false    243   �      �          0    25044    msg_clients 
   TABLE DATA           )   COPY public.msg_clients (id) FROM stdin;
    public          postgres    false    242   ��      �          0    25096    msg_conduits 
   TABLE DATA           M   COPY public.msg_conduits (id, "providerId", "channelId", config) FROM stdin;
    public          postgres    false    248   �      �          0    25136    msg_conversations 
   TABLE DATA           R   COPY public.msg_conversations (id, "clientId", "userId", "createdOn") FROM stdin;
    public          postgres    false    251   8�      �          0    25247    msg_convmap 
   TABLE DATA           O   COPY public.msg_convmap ("tunnelId", "conversationId", "threadId") FROM stdin;
    public          postgres    false    258   ��      �          0    25299 
   msg_health 
   TABLE DATA           I   COPY public.msg_health (id, "conduitId", "time", type, data) FROM stdin;
    public          postgres    false    261   ֈ      �          0    25189    msg_identities 
   TABLE DATA           >   COPY public.msg_identities (id, "tunnelId", name) FROM stdin;
    public          postgres    false    254   �      �          0    25035    msg_kvs 
   TABLE DATA           1   COPY public.msg_kvs (id, key, value) FROM stdin;
    public          postgres    false    241   �      �          0    25152    msg_messages 
   TABLE DATA           [   COPY public.msg_messages (id, "conversationId", "authorId", "sentOn", payload) FROM stdin;
    public          postgres    false    252   -�      �          0    25028    msg_meta 
   TABLE DATA           0   COPY public.msg_meta ("time", data) FROM stdin;
    public          postgres    false    240   k�      �          0    25068    msg_providers 
   TABLE DATA           :   COPY public.msg_providers (id, name, sandbox) FROM stdin;
    public          postgres    false    245   ��      �          0    25075    msg_provisions 
   TABLE DATA           B   COPY public.msg_provisions ("clientId", "providerId") FROM stdin;
    public          postgres    false    246   e�      �          0    25269    msg_sandboxmap 
   TABLE DATA           [   COPY public.msg_sandboxmap ("conduitId", identity, sender, thread, "clientId") FROM stdin;
    public          postgres    false    259   9�      �          0    25201    msg_senders 
   TABLE DATA           =   COPY public.msg_senders (id, "identityId", name) FROM stdin;
    public          postgres    false    255   V�      �          0    25286 
   msg_status 
   TABLE DATA           a   COPY public.msg_status ("conduitId", "numberOfErrors", "initializedOn", "lastError") FROM stdin;
    public          postgres    false    260   s�      �          0    25213    msg_threads 
   TABLE DATA           ;   COPY public.msg_threads (id, "senderId", name) FROM stdin;
    public          postgres    false    256   ��      �          0    25170    msg_tunnels 
   TABLE DATA           W   COPY public.msg_tunnels (id, "clientId", "channelId", "customChannelName") FROM stdin;
    public          postgres    false    253   ��      �          0    25126    msg_user_tokens 
   TABLE DATA           F   COPY public.msg_user_tokens (id, "userId", token, expiry) FROM stdin;
    public          postgres    false    250   ʝ      �          0    25225    msg_usermap 
   TABLE DATA           G   COPY public.msg_usermap ("tunnelId", "userId", "senderId") FROM stdin;
    public          postgres    false    257   �      �          0    25116 	   msg_users 
   TABLE DATA           3   COPY public.msg_users (id, "clientId") FROM stdin;
    public          postgres    false    249   �      �          0    25084    msg_webhooks 
   TABLE DATA           B   COPY public.msg_webhooks (id, "clientId", url, token) FROM stdin;
    public          postgres    false    247   ^�      �          0    25398    mydcampus_info_faq 
   TABLE DATA           �   COPY public.mydcampus_info_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link/Response") FROM stdin;
    public          postgres    false    263   ��      �          0    25325    mydcampus_issues_faq 
   TABLE DATA           �   COPY public.mydcampus_issues_faq ("ID", "General Choice", "Choice Gen Info/Issue", "Feature Choice", "MyDCampus/DLSL Option ", "Category", "Question / Inquiry / Solution / Information Description", "Link/Response") FROM stdin;
    public          postgres    false    262   ~�      k          0    24831    srv_channel_users 
   TABLE DATA           e   COPY public.srv_channel_users (id, channel, user_id, attributes, created_at, updated_at) FROM stdin;
    public          postgres    false    212   '�      {          0    24936    srv_channels 
   TABLE DATA           R   COPY public.srv_channels ("clientId", "botId", "clientToken", config) FROM stdin;
    public          postgres    false    228   �      p          0    24867    srv_ghost_files 
   TABLE DATA           S   COPY public.srv_ghost_files (file_path, content, deleted, modified_on) FROM stdin;
    public          postgres    false    217   V�      q          0    24874    srv_ghost_index 
   TABLE DATA           V   COPY public.srv_ghost_index (file_path, revision, created_by, created_on) FROM stdin;
    public          postgres    false    218   s�      r          0    24881    srv_kvs 
   TABLE DATA           O   COPY public.srv_kvs (key, value, "botId", "expireOn", modified_on) FROM stdin;
    public          postgres    false    219   ��      n          0    24854    srv_logs 
   TABLE DATA           c   COPY public.srv_logs ("botId", hostname, "timestamp", level, scope, message, metadata) FROM stdin;
    public          postgres    false    215   ��      i          0    24825    srv_metadata 
   TABLE DATA           N   COPY public.srv_metadata (server_version, created_at, updated_at) FROM stdin;
    public          postgres    false    210   ��      z          0    24926    srv_migrations 
   TABLE DATA           p   COPY public.srv_migrations (id, "initialVersion", "targetVersion", details, created_at, updated_at) FROM stdin;
    public          postgres    false    227   ��      �          0    24995    strategy_default 
   TABLE DATA           �   COPY public.strategy_default (id, email, password, salt, strategy, attributes, "tokenVersion", created_at, updated_at) FROM stdin;
    public          postgres    false    236   �      w          0    24908    tasks 
   TABLE DATA           �   COPY public.tasks (id, "eventId", status, "actionName", "actionArgs", "actionServerId", "statusCode", "startedAt", "endedAt", "failureReason") FROM stdin;
    public          postgres    false    224   �      h          0    24665 	   tbl_users 
   TABLE DATA           O   COPY public.tbl_users (fld_email, fld_password, fld_if_first_time) FROM stdin;
    public          postgres    false    209   �      t          0    24893 	   telemetry 
   TABLE DATA           \   COPY public.telemetry (uuid, payload, available, "lastChanged", "creationDate") FROM stdin;
    public          postgres    false    221   ��      }          0    24955    web_user_map 
   TABLE DATA           F   COPY public.web_user_map ("botId", "visitorId", "userId") FROM stdin;
    public          postgres    false    230   ��      m          0    24847    workspace_invite_codes 
   TABLE DATA           v   COPY public.workspace_invite_codes ("workspaceId", "inviteCode", "allowedUsages", created_at, updated_at) FROM stdin;
    public          postgres    false    214   
�      l          0    24842    workspace_users 
   TABLE DATA           K   COPY public.workspace_users (email, strategy, workspace, role) FROM stdin;
    public          postgres    false    213   '�      �           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 1, false);
          public          postgres    false    233            �           0    0    handoffs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.handoffs_id_seq', 1, false);
          public          postgres    false    231            �           0    0    misunderstood_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.misunderstood_id_seq', 4, true);
          public          postgres    false    237            �           0    0    srv_channel_users_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.srv_channel_users_id_seq', 1, true);
          public          postgres    false    211            �           0    0    srv_migrations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.srv_migrations_id_seq', 1, false);
          public          postgres    false    226            �           0    0    strategy_default_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strategy_default_id_seq', 1, true);
          public          postgres    false    235            �           0    0    tasks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);
          public          postgres    false    223            \           2606    24954     bot_analytics bot_analytics_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.bot_analytics
    ADD CONSTRAINT bot_analytics_pkey PRIMARY KEY ("botId", date, channel, metric, "subMetric");
 J   ALTER TABLE ONLY public.bot_analytics DROP CONSTRAINT bot_analytics_pkey;
       public            postgres    false    229    229    229    229    229            T           2606    24924 "   bot_chat_users bot_chat_users_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.bot_chat_users
    ADD CONSTRAINT bot_chat_users_pkey PRIMARY KEY ("botId", channel, "userId");
 L   ALTER TABLE ONLY public.bot_chat_users DROP CONSTRAINT bot_chat_users_pkey;
       public            postgres    false    225    225    225            i           2606    24991    comments comments_id_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_id_unique UNIQUE (id);
 E   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_id_unique;
       public            postgres    false    234            k           2606    24984    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    234            F           2606    24866 $   dialog_sessions dialog_sessions_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dialog_sessions
    ADD CONSTRAINT dialog_sessions_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.dialog_sessions DROP CONSTRAINT dialog_sessions_pkey;
       public            postgres    false    216            �           2606    25452     dlsl_info_faq dlsl_info_faq_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.dlsl_info_faq
    ADD CONSTRAINT dlsl_info_faq_pkey PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public.dlsl_info_faq DROP CONSTRAINT dlsl_info_faq_pkey;
       public            postgres    false    264            P           2606    24904    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    222            c           2606    24974    handoffs handoffs_id_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.handoffs
    ADD CONSTRAINT handoffs_id_unique UNIQUE (id);
 E   ALTER TABLE ONLY public.handoffs DROP CONSTRAINT handoffs_id_unique;
       public            postgres    false    232            e           2606    24972    handoffs handoffs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.handoffs
    ADD CONSTRAINT handoffs_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.handoffs DROP CONSTRAINT handoffs_pkey;
       public            postgres    false    232            o           2606    25020     misunderstood misunderstood_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.misunderstood
    ADD CONSTRAINT misunderstood_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.misunderstood DROP CONSTRAINT misunderstood_pkey;
       public            postgres    false    238            q           2606    25027    model_entry model_entry_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.model_entry
    ADD CONSTRAINT model_entry_pkey PRIMARY KEY ("botId", language, status);
 F   ALTER TABLE ONLY public.model_entry DROP CONSTRAINT model_entry_pkey;
       public            postgres    false    239    239    239            }           2606    25067 -   msg_channels msg_channels_name_version_unique 
   CONSTRAINT     q   ALTER TABLE ONLY public.msg_channels
    ADD CONSTRAINT msg_channels_name_version_unique UNIQUE (name, version);
 W   ALTER TABLE ONLY public.msg_channels DROP CONSTRAINT msg_channels_name_version_unique;
       public            postgres    false    244    244                       2606    25065    msg_channels msg_channels_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.msg_channels
    ADD CONSTRAINT msg_channels_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.msg_channels DROP CONSTRAINT msg_channels_pkey;
       public            postgres    false    244            {           2606    25053 (   msg_client_tokens msg_client_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.msg_client_tokens
    ADD CONSTRAINT msg_client_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.msg_client_tokens DROP CONSTRAINT msg_client_tokens_pkey;
       public            postgres    false    243            y           2606    25048    msg_clients msg_clients_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.msg_clients
    ADD CONSTRAINT msg_clients_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.msg_clients DROP CONSTRAINT msg_clients_pkey;
       public            postgres    false    242            �           2606    25102    msg_conduits msg_conduits_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.msg_conduits
    ADD CONSTRAINT msg_conduits_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.msg_conduits DROP CONSTRAINT msg_conduits_pkey;
       public            postgres    false    248            �           2606    25114 5   msg_conduits msg_conduits_providerid_channelid_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.msg_conduits
    ADD CONSTRAINT msg_conduits_providerid_channelid_unique UNIQUE ("providerId", "channelId");
 _   ALTER TABLE ONLY public.msg_conduits DROP CONSTRAINT msg_conduits_providerid_channelid_unique;
       public            postgres    false    248    248            �           2606    25140 (   msg_conversations msg_conversations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.msg_conversations
    ADD CONSTRAINT msg_conversations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.msg_conversations DROP CONSTRAINT msg_conversations_pkey;
       public            postgres    false    251            �           2606    25266 6   msg_convmap msg_convmap_tunnelid_conversationid_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.msg_convmap
    ADD CONSTRAINT msg_convmap_tunnelid_conversationid_unique UNIQUE ("tunnelId", "conversationId");
 `   ALTER TABLE ONLY public.msg_convmap DROP CONSTRAINT msg_convmap_tunnelid_conversationid_unique;
       public            postgres    false    258    258            �           2606    25268 0   msg_convmap msg_convmap_tunnelid_threadid_unique 
   CONSTRAINT     }   ALTER TABLE ONLY public.msg_convmap
    ADD CONSTRAINT msg_convmap_tunnelid_threadid_unique UNIQUE ("tunnelId", "threadId");
 Z   ALTER TABLE ONLY public.msg_convmap DROP CONSTRAINT msg_convmap_tunnelid_threadid_unique;
       public            postgres    false    258    258            �           2606    25305    msg_health msg_health_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.msg_health
    ADD CONSTRAINT msg_health_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.msg_health DROP CONSTRAINT msg_health_pkey;
       public            postgres    false    261            �           2606    25193 "   msg_identities msg_identities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.msg_identities
    ADD CONSTRAINT msg_identities_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.msg_identities DROP CONSTRAINT msg_identities_pkey;
       public            postgres    false    254            �           2606    25200 2   msg_identities msg_identities_tunnelid_name_unique 
   CONSTRAINT     y   ALTER TABLE ONLY public.msg_identities
    ADD CONSTRAINT msg_identities_tunnelid_name_unique UNIQUE ("tunnelId", name);
 \   ALTER TABLE ONLY public.msg_identities DROP CONSTRAINT msg_identities_tunnelid_name_unique;
       public            postgres    false    254    254            u           2606    25043    msg_kvs msg_kvs_key_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.msg_kvs
    ADD CONSTRAINT msg_kvs_key_unique UNIQUE (key);
 D   ALTER TABLE ONLY public.msg_kvs DROP CONSTRAINT msg_kvs_key_unique;
       public            postgres    false    241            w           2606    25041    msg_kvs msg_kvs_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.msg_kvs
    ADD CONSTRAINT msg_kvs_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.msg_kvs DROP CONSTRAINT msg_kvs_pkey;
       public            postgres    false    241            �           2606    25158    msg_messages msg_messages_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.msg_messages
    ADD CONSTRAINT msg_messages_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.msg_messages DROP CONSTRAINT msg_messages_pkey;
       public            postgres    false    252            s           2606    25034    msg_meta msg_meta_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.msg_meta
    ADD CONSTRAINT msg_meta_pkey PRIMARY KEY ("time");
 @   ALTER TABLE ONLY public.msg_meta DROP CONSTRAINT msg_meta_pkey;
       public            postgres    false    240            �           2606    25074 '   msg_providers msg_providers_name_unique 
   CONSTRAINT     b   ALTER TABLE ONLY public.msg_providers
    ADD CONSTRAINT msg_providers_name_unique UNIQUE (name);
 Q   ALTER TABLE ONLY public.msg_providers DROP CONSTRAINT msg_providers_name_unique;
       public            postgres    false    245            �           2606    25072     msg_providers msg_providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.msg_providers
    ADD CONSTRAINT msg_providers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.msg_providers DROP CONSTRAINT msg_providers_pkey;
       public            postgres    false    245            �           2606    25079 -   msg_provisions msg_provisions_clientid_unique 
   CONSTRAINT     n   ALTER TABLE ONLY public.msg_provisions
    ADD CONSTRAINT msg_provisions_clientid_unique UNIQUE ("clientId");
 W   ALTER TABLE ONLY public.msg_provisions DROP CONSTRAINT msg_provisions_clientid_unique;
       public            postgres    false    246            �           2606    25083 "   msg_provisions msg_provisions_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.msg_provisions
    ADD CONSTRAINT msg_provisions_pkey PRIMARY KEY ("clientId", "providerId");
 L   ALTER TABLE ONLY public.msg_provisions DROP CONSTRAINT msg_provisions_pkey;
       public            postgres    false    246    246            �           2606    25081 /   msg_provisions msg_provisions_providerid_unique 
   CONSTRAINT     r   ALTER TABLE ONLY public.msg_provisions
    ADD CONSTRAINT msg_provisions_providerid_unique UNIQUE ("providerId");
 Y   ALTER TABLE ONLY public.msg_provisions DROP CONSTRAINT msg_provisions_providerid_unique;
       public            postgres    false    246            �           2606    25285 "   msg_sandboxmap msg_sandboxmap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.msg_sandboxmap
    ADD CONSTRAINT msg_sandboxmap_pkey PRIMARY KEY ("conduitId", identity, sender, thread);
 L   ALTER TABLE ONLY public.msg_sandboxmap DROP CONSTRAINT msg_sandboxmap_pkey;
       public            postgres    false    259    259    259    259            �           2606    25212 .   msg_senders msg_senders_identityid_name_unique 
   CONSTRAINT     w   ALTER TABLE ONLY public.msg_senders
    ADD CONSTRAINT msg_senders_identityid_name_unique UNIQUE ("identityId", name);
 X   ALTER TABLE ONLY public.msg_senders DROP CONSTRAINT msg_senders_identityid_name_unique;
       public            postgres    false    255    255            �           2606    25205    msg_senders msg_senders_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.msg_senders
    ADD CONSTRAINT msg_senders_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.msg_senders DROP CONSTRAINT msg_senders_pkey;
       public            postgres    false    255            �           2606    25292    msg_status msg_status_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.msg_status
    ADD CONSTRAINT msg_status_pkey PRIMARY KEY ("conduitId");
 D   ALTER TABLE ONLY public.msg_status DROP CONSTRAINT msg_status_pkey;
       public            postgres    false    260            �           2606    25217    msg_threads msg_threads_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.msg_threads
    ADD CONSTRAINT msg_threads_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.msg_threads DROP CONSTRAINT msg_threads_pkey;
       public            postgres    false    256            �           2606    25224 ,   msg_threads msg_threads_senderid_name_unique 
   CONSTRAINT     s   ALTER TABLE ONLY public.msg_threads
    ADD CONSTRAINT msg_threads_senderid_name_unique UNIQUE ("senderId", name);
 V   ALTER TABLE ONLY public.msg_threads DROP CONSTRAINT msg_threads_senderid_name_unique;
       public            postgres    false    256    256            �           2606    25186 1   msg_tunnels msg_tunnels_clientid_channelid_unique 
   CONSTRAINT        ALTER TABLE ONLY public.msg_tunnels
    ADD CONSTRAINT msg_tunnels_clientid_channelid_unique UNIQUE ("clientId", "channelId");
 [   ALTER TABLE ONLY public.msg_tunnels DROP CONSTRAINT msg_tunnels_clientid_channelid_unique;
       public            postgres    false    253    253            �           2606    25188 9   msg_tunnels msg_tunnels_clientid_customchannelname_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.msg_tunnels
    ADD CONSTRAINT msg_tunnels_clientid_customchannelname_unique UNIQUE ("clientId", "customChannelName");
 c   ALTER TABLE ONLY public.msg_tunnels DROP CONSTRAINT msg_tunnels_clientid_customchannelname_unique;
       public            postgres    false    253    253            �           2606    25174    msg_tunnels msg_tunnels_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.msg_tunnels
    ADD CONSTRAINT msg_tunnels_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.msg_tunnels DROP CONSTRAINT msg_tunnels_pkey;
       public            postgres    false    253            �           2606    25130 $   msg_user_tokens msg_user_tokens_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.msg_user_tokens
    ADD CONSTRAINT msg_user_tokens_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.msg_user_tokens DROP CONSTRAINT msg_user_tokens_pkey;
       public            postgres    false    250            �           2606    25246 0   msg_usermap msg_usermap_tunnelid_senderid_unique 
   CONSTRAINT     }   ALTER TABLE ONLY public.msg_usermap
    ADD CONSTRAINT msg_usermap_tunnelid_senderid_unique UNIQUE ("tunnelId", "senderId");
 Z   ALTER TABLE ONLY public.msg_usermap DROP CONSTRAINT msg_usermap_tunnelid_senderid_unique;
       public            postgres    false    257    257            �           2606    25244 .   msg_usermap msg_usermap_tunnelid_userid_unique 
   CONSTRAINT     y   ALTER TABLE ONLY public.msg_usermap
    ADD CONSTRAINT msg_usermap_tunnelid_userid_unique UNIQUE ("tunnelId", "userId");
 X   ALTER TABLE ONLY public.msg_usermap DROP CONSTRAINT msg_usermap_tunnelid_userid_unique;
       public            postgres    false    257    257            �           2606    25120    msg_users msg_users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.msg_users
    ADD CONSTRAINT msg_users_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.msg_users DROP CONSTRAINT msg_users_pkey;
       public            postgres    false    249            �           2606    25090    msg_webhooks msg_webhooks_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.msg_webhooks
    ADD CONSTRAINT msg_webhooks_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.msg_webhooks DROP CONSTRAINT msg_webhooks_pkey;
       public            postgres    false    247            �           2606    25593 *   mydcampus_info_faq mydcampus_info_faq_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.mydcampus_info_faq
    ADD CONSTRAINT mydcampus_info_faq_pkey PRIMARY KEY ("ID");
 T   ALTER TABLE ONLY public.mydcampus_info_faq DROP CONSTRAINT mydcampus_info_faq_pkey;
       public            postgres    false    263            �           2606    25595 .   mydcampus_issues_faq mydcampus_issues_faq_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.mydcampus_issues_faq
    ADD CONSTRAINT mydcampus_issues_faq_pkey PRIMARY KEY ("ID");
 X   ALTER TABLE ONLY public.mydcampus_issues_faq DROP CONSTRAINT mydcampus_issues_faq_pkey;
       public            postgres    false    262            C           2606    24840 (   srv_channel_users srv_channel_users_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.srv_channel_users
    ADD CONSTRAINT srv_channel_users_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.srv_channel_users DROP CONSTRAINT srv_channel_users_pkey;
       public            postgres    false    212            X           2606    24944 &   srv_channels srv_channels_botid_unique 
   CONSTRAINT     d   ALTER TABLE ONLY public.srv_channels
    ADD CONSTRAINT srv_channels_botid_unique UNIQUE ("botId");
 P   ALTER TABLE ONLY public.srv_channels DROP CONSTRAINT srv_channels_botid_unique;
       public            postgres    false    228            Z           2606    24942    srv_channels srv_channels_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.srv_channels
    ADD CONSTRAINT srv_channels_pkey PRIMARY KEY ("clientId");
 H   ALTER TABLE ONLY public.srv_channels DROP CONSTRAINT srv_channels_pkey;
       public            postgres    false    228            H           2606    24873 $   srv_ghost_files srv_ghost_files_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.srv_ghost_files
    ADD CONSTRAINT srv_ghost_files_pkey PRIMARY KEY (file_path);
 N   ALTER TABLE ONLY public.srv_ghost_files DROP CONSTRAINT srv_ghost_files_pkey;
       public            postgres    false    217            J           2606    24880 $   srv_ghost_index srv_ghost_index_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.srv_ghost_index
    ADD CONSTRAINT srv_ghost_index_pkey PRIMARY KEY (file_path, revision);
 N   ALTER TABLE ONLY public.srv_ghost_index DROP CONSTRAINT srv_ghost_index_pkey;
       public            postgres    false    218    218            L           2606    24887    srv_kvs srv_kvs_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.srv_kvs
    ADD CONSTRAINT srv_kvs_pkey PRIMARY KEY (key, "botId");
 >   ALTER TABLE ONLY public.srv_kvs DROP CONSTRAINT srv_kvs_pkey;
       public            postgres    false    219    219            V           2606    24935 "   srv_migrations srv_migrations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.srv_migrations
    ADD CONSTRAINT srv_migrations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.srv_migrations DROP CONSTRAINT srv_migrations_pkey;
       public            postgres    false    227            m           2606    25005 &   strategy_default strategy_default_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.strategy_default
    ADD CONSTRAINT strategy_default_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.strategy_default DROP CONSTRAINT strategy_default_pkey;
       public            postgres    false    236            R           2606    24915    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public            postgres    false    224            @           2606    25649    tbl_users tbl_users_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (fld_email);
 B   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT tbl_users_pkey;
       public            postgres    false    209            ^           2606    24963    web_user_map web_user_map_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_user_map
    ADD CONSTRAINT web_user_map_pkey PRIMARY KEY ("botId", "visitorId");
 H   ALTER TABLE ONLY public.web_user_map DROP CONSTRAINT web_user_map_pkey;
       public            postgres    false    230    230            `           2606    24961 '   web_user_map web_user_map_userid_unique 
   CONSTRAINT     f   ALTER TABLE ONLY public.web_user_map
    ADD CONSTRAINT web_user_map_userid_unique UNIQUE ("userId");
 Q   ALTER TABLE ONLY public.web_user_map DROP CONSTRAINT web_user_map_userid_unique;
       public            postgres    false    230            f           1259    24993    comments_agentid_index    INDEX     P   CREATE INDEX comments_agentid_index ON public.comments USING btree ("agentId");
 *   DROP INDEX public.comments_agentid_index;
       public            postgres    false    234            g           1259    24992    comments_handoffid_index    INDEX     T   CREATE INDEX comments_handoffid_index ON public.comments USING btree ("handoffId");
 ,   DROP INDEX public.comments_handoffid_index;
       public            postgres    false    234            M           1259    24905 
   events_idx    INDEX     D   CREATE INDEX events_idx ON public.events USING btree ("createdOn");
    DROP INDEX public.events_idx;
       public            postgres    false    222            N           1259    24906    events_messageid_index    INDEX     P   CREATE INDEX events_messageid_index ON public.events USING btree ("messageId");
 *   DROP INDEX public.events_messageid_index;
       public            postgres    false    222            a           1259    24975    handoffs_botid_index    INDEX     L   CREATE INDEX handoffs_botid_index ON public.handoffs USING btree ("botId");
 (   DROP INDEX public.handoffs_botid_index;
       public            postgres    false    232            �           1259    25115    msg_conduits_channelid_index    INDEX     \   CREATE INDEX msg_conduits_channelid_index ON public.msg_conduits USING btree ("channelId");
 0   DROP INDEX public.msg_conduits_channelid_index;
       public            postgres    false    248            �           1259    25151 '   msg_conversations_userid_clientid_index    INDEX     u   CREATE INDEX msg_conversations_userid_clientid_index ON public.msg_conversations USING btree ("userId", "clientId");
 ;   DROP INDEX public.msg_conversations_userid_clientid_index;
       public            postgres    false    251    251            �           1259    25311    msg_health_conduitid_time_index    INDEX     e   CREATE INDEX msg_health_conduitid_time_index ON public.msg_health USING btree ("conduitId", "time");
 3   DROP INDEX public.msg_health_conduitid_time_index;
       public            postgres    false    261    261            �           1259    25169 (   msg_messages_conversationid_senton_index    INDEX     w   CREATE INDEX msg_messages_conversationid_senton_index ON public.msg_messages USING btree ("conversationId", "sentOn");
 <   DROP INDEX public.msg_messages_conversationid_senton_index;
       public            postgres    false    252    252            �           1259    25298 -   msg_status_numberoferrors_initializedon_index    INDEX     �   CREATE INDEX msg_status_numberoferrors_initializedon_index ON public.msg_status USING btree ("numberOfErrors", "initializedOn");
 A   DROP INDEX public.msg_status_numberoferrors_initializedon_index;
       public            postgres    false    260    260            A           1259    24841    scu_idx    INDEX     Q   CREATE INDEX scu_idx ON public.srv_channel_users USING btree (channel, user_id);
    DROP INDEX public.scu_idx;
       public            postgres    false    212    212            D           1259    24859    sld_idx    INDEX     L   CREATE INDEX sld_idx ON public.srv_logs USING btree ("botId", "timestamp");
    DROP INDEX public.sld_idx;
       public            postgres    false    215    215            �           2606    24985 #   comments comments_handoffid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_handoffid_foreign FOREIGN KEY ("handoffId") REFERENCES public.handoffs(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_handoffid_foreign;
       public          postgres    false    234    3429    232            �           2606    25054 4   msg_client_tokens msg_client_tokens_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_client_tokens
    ADD CONSTRAINT msg_client_tokens_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 ^   ALTER TABLE ONLY public.msg_client_tokens DROP CONSTRAINT msg_client_tokens_clientid_foreign;
       public          postgres    false    242    243    3449            �           2606    25108 +   msg_conduits msg_conduits_channelid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_conduits
    ADD CONSTRAINT msg_conduits_channelid_foreign FOREIGN KEY ("channelId") REFERENCES public.msg_channels(id);
 U   ALTER TABLE ONLY public.msg_conduits DROP CONSTRAINT msg_conduits_channelid_foreign;
       public          postgres    false    3455    248    244            �           2606    25103 ,   msg_conduits msg_conduits_providerid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_conduits
    ADD CONSTRAINT msg_conduits_providerid_foreign FOREIGN KEY ("providerId") REFERENCES public.msg_providers(id);
 V   ALTER TABLE ONLY public.msg_conduits DROP CONSTRAINT msg_conduits_providerid_foreign;
       public          postgres    false    245    3459    248            �           2606    25141 4   msg_conversations msg_conversations_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_conversations
    ADD CONSTRAINT msg_conversations_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 ^   ALTER TABLE ONLY public.msg_conversations DROP CONSTRAINT msg_conversations_clientid_foreign;
       public          postgres    false    242    3449    251            �           2606    25146 2   msg_conversations msg_conversations_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_conversations
    ADD CONSTRAINT msg_conversations_userid_foreign FOREIGN KEY ("userId") REFERENCES public.msg_users(id);
 \   ALTER TABLE ONLY public.msg_conversations DROP CONSTRAINT msg_conversations_userid_foreign;
       public          postgres    false    249    3474    251            �           2606    25255 .   msg_convmap msg_convmap_conversationid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_convmap
    ADD CONSTRAINT msg_convmap_conversationid_foreign FOREIGN KEY ("conversationId") REFERENCES public.msg_conversations(id);
 X   ALTER TABLE ONLY public.msg_convmap DROP CONSTRAINT msg_convmap_conversationid_foreign;
       public          postgres    false    251    258    3478            �           2606    25260 (   msg_convmap msg_convmap_threadid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_convmap
    ADD CONSTRAINT msg_convmap_threadid_foreign FOREIGN KEY ("threadId") REFERENCES public.msg_threads(id);
 R   ALTER TABLE ONLY public.msg_convmap DROP CONSTRAINT msg_convmap_threadid_foreign;
       public          postgres    false    256    3498    258            �           2606    25250 (   msg_convmap msg_convmap_tunnelid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_convmap
    ADD CONSTRAINT msg_convmap_tunnelid_foreign FOREIGN KEY ("tunnelId") REFERENCES public.msg_tunnels(id);
 R   ALTER TABLE ONLY public.msg_convmap DROP CONSTRAINT msg_convmap_tunnelid_foreign;
       public          postgres    false    258    253    3488            �           2606    25306 '   msg_health msg_health_conduitid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_health
    ADD CONSTRAINT msg_health_conduitid_foreign FOREIGN KEY ("conduitId") REFERENCES public.msg_conduits(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.msg_health DROP CONSTRAINT msg_health_conduitid_foreign;
       public          postgres    false    248    261    3470            �           2606    25194 .   msg_identities msg_identities_tunnelid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_identities
    ADD CONSTRAINT msg_identities_tunnelid_foreign FOREIGN KEY ("tunnelId") REFERENCES public.msg_tunnels(id);
 X   ALTER TABLE ONLY public.msg_identities DROP CONSTRAINT msg_identities_tunnelid_foreign;
       public          postgres    false    3488    254    253            �           2606    25164 *   msg_messages msg_messages_authorid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_messages
    ADD CONSTRAINT msg_messages_authorid_foreign FOREIGN KEY ("authorId") REFERENCES public.msg_users(id);
 T   ALTER TABLE ONLY public.msg_messages DROP CONSTRAINT msg_messages_authorid_foreign;
       public          postgres    false    3474    249    252            �           2606    25159 0   msg_messages msg_messages_conversationid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_messages
    ADD CONSTRAINT msg_messages_conversationid_foreign FOREIGN KEY ("conversationId") REFERENCES public.msg_conversations(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.msg_messages DROP CONSTRAINT msg_messages_conversationid_foreign;
       public          postgres    false    252    251    3478            �           2606    25279 .   msg_sandboxmap msg_sandboxmap_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_sandboxmap
    ADD CONSTRAINT msg_sandboxmap_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 X   ALTER TABLE ONLY public.msg_sandboxmap DROP CONSTRAINT msg_sandboxmap_clientid_foreign;
       public          postgres    false    242    259    3449            �           2606    25274 /   msg_sandboxmap msg_sandboxmap_conduitid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_sandboxmap
    ADD CONSTRAINT msg_sandboxmap_conduitid_foreign FOREIGN KEY ("conduitId") REFERENCES public.msg_conduits(id);
 Y   ALTER TABLE ONLY public.msg_sandboxmap DROP CONSTRAINT msg_sandboxmap_conduitid_foreign;
       public          postgres    false    3470    259    248            �           2606    25206 *   msg_senders msg_senders_identityid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_senders
    ADD CONSTRAINT msg_senders_identityid_foreign FOREIGN KEY ("identityId") REFERENCES public.msg_identities(id);
 T   ALTER TABLE ONLY public.msg_senders DROP CONSTRAINT msg_senders_identityid_foreign;
       public          postgres    false    3490    255    254            �           2606    25293 '   msg_status msg_status_conduitid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_status
    ADD CONSTRAINT msg_status_conduitid_foreign FOREIGN KEY ("conduitId") REFERENCES public.msg_conduits(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.msg_status DROP CONSTRAINT msg_status_conduitid_foreign;
       public          postgres    false    260    248    3470            �           2606    25218 (   msg_threads msg_threads_senderid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_threads
    ADD CONSTRAINT msg_threads_senderid_foreign FOREIGN KEY ("senderId") REFERENCES public.msg_senders(id);
 R   ALTER TABLE ONLY public.msg_threads DROP CONSTRAINT msg_threads_senderid_foreign;
       public          postgres    false    3496    255    256            �           2606    25180 )   msg_tunnels msg_tunnels_channelid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_tunnels
    ADD CONSTRAINT msg_tunnels_channelid_foreign FOREIGN KEY ("channelId") REFERENCES public.msg_channels(id);
 S   ALTER TABLE ONLY public.msg_tunnels DROP CONSTRAINT msg_tunnels_channelid_foreign;
       public          postgres    false    3455    244    253            �           2606    25175 (   msg_tunnels msg_tunnels_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_tunnels
    ADD CONSTRAINT msg_tunnels_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 R   ALTER TABLE ONLY public.msg_tunnels DROP CONSTRAINT msg_tunnels_clientid_foreign;
       public          postgres    false    3449    242    253            �           2606    25131 .   msg_user_tokens msg_user_tokens_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_user_tokens
    ADD CONSTRAINT msg_user_tokens_userid_foreign FOREIGN KEY ("userId") REFERENCES public.msg_users(id);
 X   ALTER TABLE ONLY public.msg_user_tokens DROP CONSTRAINT msg_user_tokens_userid_foreign;
       public          postgres    false    249    3474    250            �           2606    25238 (   msg_usermap msg_usermap_senderid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_usermap
    ADD CONSTRAINT msg_usermap_senderid_foreign FOREIGN KEY ("senderId") REFERENCES public.msg_senders(id);
 R   ALTER TABLE ONLY public.msg_usermap DROP CONSTRAINT msg_usermap_senderid_foreign;
       public          postgres    false    3496    255    257            �           2606    25228 (   msg_usermap msg_usermap_tunnelid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_usermap
    ADD CONSTRAINT msg_usermap_tunnelid_foreign FOREIGN KEY ("tunnelId") REFERENCES public.msg_tunnels(id);
 R   ALTER TABLE ONLY public.msg_usermap DROP CONSTRAINT msg_usermap_tunnelid_foreign;
       public          postgres    false    3488    257    253            �           2606    25233 &   msg_usermap msg_usermap_userid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_usermap
    ADD CONSTRAINT msg_usermap_userid_foreign FOREIGN KEY ("userId") REFERENCES public.msg_users(id);
 P   ALTER TABLE ONLY public.msg_usermap DROP CONSTRAINT msg_usermap_userid_foreign;
       public          postgres    false    249    257    3474            �           2606    25121 $   msg_users msg_users_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_users
    ADD CONSTRAINT msg_users_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 N   ALTER TABLE ONLY public.msg_users DROP CONSTRAINT msg_users_clientid_foreign;
       public          postgres    false    242    3449    249            �           2606    25091 *   msg_webhooks msg_webhooks_clientid_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.msg_webhooks
    ADD CONSTRAINT msg_webhooks_clientid_foreign FOREIGN KEY ("clientId") REFERENCES public.msg_clients(id);
 T   ALTER TABLE ONLY public.msg_webhooks DROP CONSTRAINT msg_webhooks_clientid_foreign;
       public          postgres    false    247    242    3449            |   �   x���M
�0�ד�DMt��[!m���L$�Xz{ۊ�Uܿ����UŹAV1��i-���=V��1����ԱP�0�چ[a٠�%�d��",�02w��p�)��P$8,b��Yۍ%������b[������oE����ӡ
�o.J�{s�i�'%����{�֧U����u#�x ���      x   L   x�M�1� Й��J�Ի8��f\4�ۻ��w��w�?��O��i���A�L��[g��*�J.���+�}Ԝq      �      x������ � �      s      x������ � �      o      x������ � �      �   �  x��Z�r��]s��7)K�cF�,&�E�hF�q�ƩTh
]�p7 �Y�����Krn?�$R�$�xa�����<��Ƽ��fr�f��7x/
�y�&�\�|�~t�>��g3UW��c����sY*]Յ��0��Ռ}�υ6Ln�Ϫf1/X"M�n�D\k-�
�V��
O�*ժ�N�W�5���߷Ҫ*��h�X,�$3Y$�:*ӑ4�	m��E�O�H�9;ӹ�}��=[2�u��}�J�S9�Opz��_���2����FC a��C�0�n�?x�����^����ւ'���6���i��(��N�Jd���[/�*�����K�ɸ��
>�1�A�΄3��&Ɏ�a�%#��\z�D/�1RÿI��2^$�-�,��ͯ��i*^���d�a��V��r^p'\�O��/I��O)�t_X��Q����c-Y��͖���M��%�"];�Vel.�i����N���A����4�����F���9R�lB��;� �M%����m�1������Lή>�/��Zjqcs⺖�@d�s��u����>�L�E�r�g�:��C��J��Z,U���.2FTf$y���9�De2o]�^[�L�Te\�T��/�L��}<`�g:����;r�1�Ա**W�sndl�u�)��(�I���7�A�j�6��z�����5�4�*g'��U��b�;�B	_��wZ�S�p��7h�����{I��1�{'�����2by�E�>q���u��e��XW_�������i�{�Tt��r,�~�;�ay�����߽L������ڮt��Qq�>���DWu?X	��y�j�ř����d��寝���Oz�|<��\�jgC�c���!����#j�HTG-**S�B�A�vK���Z�J'&�Qd�����GHo���;�N���{�"�x@�vS$MOងGM�"6���RF�Zsjb�%*�x���xS�<�)g�(X�_���%�.����R���Sݝ��P��svu�XJʾ�o�C��l��8���ۄ�J��r!f=����9�}��e�=��x8��d���俈k�Y�����fp�e�P$�������Q>=�	���$��f �Y�݉�h�D��
1�M���BZ�[x�� �ͩܰL!T���K�h���&�2P*-�g�<ԡ�wD��dn� K�l�
!��9��0��N}*�~N�F<�f6�Y��$e��F�Hh�nA�r;߶�C�|{˳�68{8N����es������d�*Ԑ��7�����Y�)]����:
�^�/W�M�mS�&�B"��X�4�?��B���@�{8o�wY���0�$u�����y�{Z�Yh]�s�V"��Q��$M����=h�� 6u 6�Q5ɹQ��'qx6bg%�KZRu�e�-�����%j2w�E��<�=4��Z$"^��k�=�A ����u�(��0�����L�#p~
eUK+�ʐ�3巤9�Ij��q���W�9����-,��:^ĩ�l��r�þ���;���9>��,��7;l�ʂ���˾�1�n>:Ǻ���1xN���TiO�k���o\���=�2_��$R�;��<�-F)�4�\
�_�G�d6�E���r&!mR�̄�Ƽ��.�ke�jS��S.�a:�C���O��Bu�ā�铻K��ԥ��t2ݎ�� ]x6Hk��� ���m(V�>��~#1�����N�K�E"y[�7B�q�o�KK�u�X?)7[^�sʾ�㱘)�2���*�g>¨��2&ޒoﰯW�X�T�H��nR��N��P��g�/��qʋBd���x�ivy�����ώ?^�w{'g�9� I��
�����dXv�"	�?��#}�@��!a�9���6cq���R�����({�I'���OW�8�C�u� >��l�};o���\/Ӎ�Tkv4�J���e�İ�ПR�\A���Qd1��d6���0��0k�Z��Q�r�+���k{3���Wa����5Νz"��L2�F�ZG���X�ھWy��)�F���H���qy���9�a=��0��������ne�h{M��h�O����.l�|��������v�����a�WKR軪�*����\O�ﯩ *�X �4j!�

�b2�Ap�1 R3���AiV�6ЊP|0W:46��A�����^ԁ iǼ�3�9yYfҏm�f�'._�OyV�9�֭��2-a���lw1���]��[ߩ���V��.'�tof(�;-��e�=EF ID���������W�@cM��H` ���\�aFޱ��m�UĮz�&�vl׷�Kp ͳ <�a#�=��>m�,�v~�z#:>t�m��]Y��|���$���;e���d'��d���r��a�	W����1H7v��$�V�6�nyr&�UKTMS�B��I�歀�6�1_Վ�����+�J���NZ)'�5>l�����F��$����7��C�����OSz�)��.� ,��?���� 5�K����3�/o�/��;8wє��L��Y�[�߲u>CK>e�?������F�l�χl���6;�����>S�4�:e�'{'�����G'G�_zǴ�zK'�=�×/�^=ߖ���	{������y���Qoa��Ɂ]�;�;��wC_X{;���m��I�����!}�ױL�$>�[�h��+�X���M]`�d�����C֍x���ۮ���$�i�^�IUeߧEm�hj��$�ZmK�[γ?�݌��0�ߴBAZwu	ʛSL蓅V�\�p����%�gg�fմD�3�r�0�8�$u�u�=h��#Y�õbW���L������ކc�I9��L���+����mw����AUV�|�|v�!�_���@Ӌ:6w���ww��pxH�VϣW��f�!S؛J3J]o����ϸu�z��W�r'z�K��ŋ� ��      u      x��}ksG��g쯀9�㙸*��]U��^I��!QQ^�=3��~QA�@=<1��V�����7�z�FW���<'+�B�� �c)��)V ����d KF$GR�7_}����w�|��I|��
P�@� $t�@(����y����$�Ѣ��pBȈK(%�%��T�>=m�����OX_����j:�\h�}	�B�d�������h��68:=2M��y��d�������hx��t�����[�u<U��i�����:O?�O��,~xz�c0O����x�nn��ûy0�F�|�f��������ό(#>�˴V����o22Z��3����ck�4�"�ߘ.`�  B �w��"v�ȱD�7���~Ϗ4c�bdޥ��e�g|�Wt=��y<H7�|���蛛,K��oz����`��<������̐~g������gGc5���ߧMN�~Kݸ�����<T㹞��x�H~�h��͍�����L'���$�����P�g2�W㩫�G˦ɷ��t�˯�=����<nh�J��o�����d�5�8�.�������b%��y�<DA��(��@P=�,�!Ds�Þ�iO�}{3|̂�b��w|;�<Z�~��Ͳ�f��l��^^0�̇j�G��w��^��wG`���EK�5Tu:����:��t��FW#<`�P�0@=%��>&'�#w�u��FOZK���5R�ڈ���_,nOON�SO��O�S!<Q���O�D��$?$'7�?R'��^�/WW_���>�,��H-����П�o���W��|��,��]���t
��uJn��k�&���k �r k}u�!b�#�>C@�P@�$ҁ�G����`��{ ��t��V�.�(h~=1��Ƌ�9#���daNN5��N�I���ø��?�I�Ϧ�Ǝ�i����t�3-�"�x||���m�f��Tw����l��0����L�Oj|g^3�/�_��gY��n��x�����C�#��C~I�����-47��^k�w�<�ADYw��f�A�|fW(�&���+=*2�gmv��P1��P��+��i�a.v�_��J����*�W�J�̾mo�j���V-�l��X;p�п����R�ӻ^̔Y�Z���[k��������\��YS���(���� Ћ9R�M��o�n�0.瑾�ԫAZ�	����x*�L�-w㿎���L����/�Ψ�I,@�b�Z_��~���̓t䴂���禟�W��gG�nn���b�dL˝�x�E�3����-��ċ��t�=M/}2?64K�U���^F��T��g}(���8�iotzs������ &�u�E��?����������n4�Swi���wo^��I��D���X��Z&�^_�3�<5? w�G/=2�V����>KZeq^��Լ��t7��t>]��t�V_�㶛gļ2n�&~��7������X��}R��9���ᑍſ�����0E�(��Eps��o��KG9�)���������![:X#�z9�*���mT�>�#��/�������`�)��Пl��Gg���}LF�.�w3���j<�z�&��fi��*��t#�+z-��?|��K���K�������n��w��|�[�����;���/�?g���)Z�ëX�iS�%=3;0����ȡ��5�,�&F�����J5�?��V5���3Jĸ5�:JΣȚ��g�b=S��J[_ZȨ�����T����Cw�tj~����8���r���|>}���n|�.�M���叼�8�I�|��N��&]���&Rd*E�@�Ǟ�]��8�S}(��6�M����&W�I���HjI���&��Y��Կ4�kcQ�(t|��N�f+��|瘖e���e��K�$�ͩ� �E�&*� Omv2�����]�XT�����'��)�)��M'o���k�e�Y��0�x�����;2��(���ڍ<���JܲD7͗gB�5/�5u�~�"X��8��%����Bu7^#��Ƨ��ȑ��bF�#Ѕ!���������u�x��*��_����Ȼ���I۵.�Bٵε��a�b�ci~��r��ٻ/������˭�����=��k���}8����L���a�^�pE� �?���:��ޖ'~C�1��Zy��B}1��jO��9��W����<���lNgZc뮦�u�G�r���'C��_��x5��(��c�D2�kYr�ؼ|64��A����`�������ƈ��wA*��FHe%�6���~7��I7UC���#P��ݷ�rs�)������߫�_�@�|.w`�9�w��1a��R�Q�)�q�zL9L�Y��^���F�Ĩ>`$��)[a$��#�r��H� F��!��vAHL{�!��tBH2I]-�~#J���hYwFH��!ɚ��ۻ�O!N�D��1\i�.�2���A`bC�>v��M������b<�,����%+��&w��{�zj�M�(Zل�h�-���_$qV˨����:�Щ
�
�Z��U
��FK��s�FVj=DD���xg,)�-,�n�W�_5ٿ��W%�y���j�G�2��I�%��q:��ۑ���
�.��P��C���*�z����bō�D��������^�������_��;���e���tk����hz	�*`����.�<3?b�?v�n@���c�g���˝�r��w��"&_d+��o�������b�.F�hL1�w��<K,�BE̇)`�]��+R��~=��M�]K@�������&�I��� �>(pZ�Z��-w��)�k#˂"ޢ����d�Y��%�U/0�J��+85M��ܜ��9��p��ps"Gt���+��dS�9iO���E)��͖����X�D=�͉(��+@��͉�6yV���D.o
7��S��ͩFZ".R[HXps���B�*�5����.�*�s�0���=N��
n^��<0���Z}�f�ף�?��K[ȏW��^��*/3�f^���\����rbʮp���,�������l�z��h�﹡V��r1�a(	v������_y��#�^Ȁ<��[7�ғ�8|�^-�\������nr�'z�Ë��S��ww�2�I}5YP�w//.^�<7�����ۂ��s��������~Ӂh�6��8aR���<X�*`��d6�/�q���%�� ��4�*!��	�ش�vГ����I����������D{8���p�r:b�+澪�^���U$�v�O��n�*��?�>s��mE����~;ۈ*����g/�-��sL���#�^}����?�;��������d��	��-��I�9z�z������.�����E��������L]M'�+?�T.��O��B�W�;LdS�p���"�cE�j�����ǘ���Յr�S �ks���D)+;o��l4��rG����A��1Z�:Dlɝ��+���/�f�~�|����,3�65j�ոX?wo�����k�����\i�K<���0�Z��Ͽ{���ó���_^�f�zA��}���el�[b����Pe��R)4#�k��_)��R�8���&����6��EN��3�tq�jE�_�/�麟���c>0@���a�L��3@�ډ�El� 9Tl� ��7e�l)]��������p�����A,�A]�H
k� ��� Er���zH,�d�~���s��L��[Vu��->p}"� $JH�
C�%���L�k����4_4�v�71�Ctͻh�*;-u��i�k鑒S��VL�>yzD`"(��	:�Tѐ�`�2@e(�ľ 
2�z�����}��^��w�RZ
!��Q��+�)0�+Q�ȇ�K �b�����p̑�ߵƎ�s�ʗ�6Z,+x�&��+V�^rH	&���A ��
��b}*)��}	 S�Q��
�X�����,�V��<ǡB���n�=ǳ���w������mlu��w�0��chm��N�]Rl�!�Sܮ���t��5��!�d�C���q=O�    v��	\I�8C�>��u�Q�n�H%��ń���-�`��!�RXkWv�������RxF�VjX�F2�@���c���mk)�@�f�f��ԍe�>3���	���>]C�7���Mkľp/�&RJ̓F��	d��\9����Xl7j�b"���1'��4b{�(��Ic��-�E��I'��Nh��Lӥ9�g���Dˏs/'R��"s`x����ی���܌�������ː���7���-;��k�Q��+$[8B��%�ȔO�����s�cAW�ͮ�C!I���}A�+���뀦���m:�^,w�x�?@�Nb��>Db�������~�/G��r���V�Gu<U�q��c��N�#�[G:�NQ�ԊI�Α�g�H���#9m�Pj�Q�C*w�t�%m�Hq`�H�T�!�!��t�tH�p�<��n�_�C*�v�tH�0�!9Ȣyy��K�!��Lr�p��#�(��
�).�q =�@�"�4D���/2X�tX	�g�CE<�C�w���]1}{Yو`En5��d1�Qre�x�혚�,In'K����+H���;�䀢� ���>(�6�B�Ǳ;��#J��dYܴ�Ğ�q��:�4� ����v�^X�e�~�!ZA�7Y�O\G ��x(��� +!�������Z��A}��=N�Q{]�0
0��Xנ��;��<���;x�@�mN��y�O>���ݹ�OV'�]I��R?֬���.�c��o;^o�@�-���Zi��V�इd�FN/�;x�	;$���o���HA�	<[R�d�F��N�%
��T�D�R��F������ȕ�\U6��J�M�'�W?Bo��2HO �9��p3: �����vy�/0P��Cב:�t!��U�X�#�R��t����jC��b���V��1�;��N6�k�;FT@���Pn��� \'�_�}�=$;�@�Ynhw?��A�5Y�O]G0��G�ja2��^/�@
i�BW���P{�R�\2��:bEB�����������ߚ�s��$r�������Q"�4[��g-�V ��9U(}NP�Eա����;VC�Ͻ��A�Gs�o|?�w�=��=Xg95`���+�.B�����`K}l�H�C(��B D�s�j���}�����݀�F�/��|ni�#|�hg۬��7��ƠS��&��%\_�Ѳh@�A!���(��(DRT��1���~�,�l��8��F���E�����g�����ix���wË;m���T�Q�%-���ʔ�O�fO�&�=�?P�;׏C-��T��������A�������	<�i,�"[���-�)�7N)��"���DtH)��qv��S�)��i�$uI)o�8��iD��J)�A(���7Rh���Y�~S�������0�M/Z'�s�h�4"�
��	ԧh@�_
8����D�g�y2���Pg��!�Or��߉�?�K~����c�̭0\= u��h=P4��ܸ����l�$�z�f(�C����%�b!.�nȔ
B�U����U�캍�#���z0թ��X:	��.>��M�ä�4�M�-Y�b��A���I̵ڛ����N��wq9��ΊИ&J�k`����!���#Pp2@Хz�\�B���^jX��|���{��+j�PH�^��d�D[��jr�Z��X�G�b�Ҳ�BM�kvt�EY���~�;����e*�h�Ҁs��P�����9��Х��WP�{�2��V����[�CA�,�"_g;&�<��w���]���F�ML�&E�[��7�}��.�^<dN�v���2C��P}{��Q��r�����d�ݏ���I��ew/�?��n��gGZC�Ԙ�-U�n`7�ȥ�В��-z�#���t��z�#��;БV���HKJ':2�ԅ��R
��7�#�(�':R3�
�ft���P;:2k�/i�:�БZ�yQ��H��W��u39љ��Ӛ�}�H�G�J-Ar���d�@!H�/��P ��Ox(ǁ�K,8u�{��u�#�ͮ�hw#�m�[��O������Φ~ >vpG8�0:��{�O���v9
/MF�hG4kb����"��<�l�5]��n{]�O`���E���m)v?Tl��ۻ7��ۍb�sѐi@���4Z�/�7�w�
Y�S���T�v<��u,���p�y2�~��n�gS�pE�J���Fj��BIZ�
��}��:�*
>=��kF���C�����k�э~��9�حު&]��ڡ��A[� ,�%���2-(�^0��a�8h.Dt/��pA7�J�7-Ia���T��	:H���q.9:�K�(#��N�A"%)<մdT�I��N�QJ��v25�^�k�TC�kN��ځ����(�|
\�u:%Q4�+ ��/)	t��?/���5�8 ��`<����w��D�${ �Ξ}~m٬xM��Bb,˺���a��G����.��A�0�P:d�yt� '��	�sGE@=�q������vlO�}{3|�Ci�Ʒ����վLv��?�G��(�Ҩ��7����cdLa-Z:����+�`�?u�A�*CR�J�<1g ���.�^GH�b��$!�=N+9�-uFԦ��H�Z#~zz�~��==9O=5~?�/NMu�u;:��N� �O�Crr�/u"����ru�E��[���B��b�_�	���6�)iX�Uh_���T
qzP)�Z�W M�SW 41�?L��C�UJ���}����k�K//��Mx�	DQ�W�}I����^˶���9��u�YS\�G��5��X��2���5��tD:�2g%!���$P�`����� (�'
�rF��_Qq�����_ĻⳚ,�q����'5�,e#�����5�����0�K�kxɂ�����ĭə�Xw'��,5�|fW(�&���F��J;Xb�L�s*� zwB��[�S`J��J�2H��vF���(l���]�����ݏ��|s���b�:�Kbۣk��5}�#:��� 6*��ղ���������
�o�T1z�
yZ�Rk��\�dw����5QPY
�p:���ƧL�=�}2ҟ���W������ШB�����q��tm��IL�㷁�B&���d��{�a`\X�1�qU�\na��r��:DX"��~�FV������/�U��zț���R����6?:��f+�m��L,��9�C��TD�⧉.7E��o�fK��f$%I>;��)���f�$���E�x�P4#�V�h�&��bK�b�<.ͼ���K�4�PJ(�J)9�ǾO0�\i +
\�p��!�&���_�eԼwىTyj�M�(�à��y�5��Z�/�W��v���._��8��>d�KC�!��,sqs�rn�k!�ټ��Z��l�G B��92uu� 9�/B� ��K0����P�q���ek!��(lrn�'ri�^��|�ݫ���_>{����gv�:����l��F����&��.��Q:�݀�C�v�;�� ���h@���_�]��ѝۋ��=S(7�o�'ϒ�8���0�}��AR!���Ӕ�� ?���l"�"n|�_���⯥���r��}w�;�McU�+ �Ԭ*��M��j��wi;�Z��{-���
utֈ����#���V��Qk��!���$uA���j�E�>JA%�Hw�ZK��.P��Zk�L�@��1'��֑Fʀ�9�&��>��B_R���8��H����@ѐ�P:^����
�z-t�����k���a�c^w.m�܍�^A�*/3�g^��2W֕M۔�V�>�U�$�Q��V�P�����n�qk��)��Z��s��j=J�j�<D+�8a�
�� �\�0��$���=�:VWFa�pu�D�b]L���O�1d]��=���o:�@�4�6H�0�\�Z�*�+l*�]���֠����M[h=�����i[QYbGQyĥ�D{T�~
�|y(:B�+�P]��B��[���bK�������3�n+�!.h��\�����Ӡk��e�{"��_��<��    ����|姑*U�[AR�0�M��q�i��bY�W��=ìk���zu��V�#KGB¤�Cie��^P�t�cB7/����rp�r�6�nT��M>��]]�������7U�iCol�d̞Q)�B3n�Vh��2�R)U�㫏za�Z��Wl��Z�O>SNW�Vd��r	�������H��PֆH2-8�N$9v"�"�;��� �7'����+�dK�B$�$u ��Bz!��(��!�"Y�+�d�$I��I�&�IFnR��k�_ca���~�F�R''+�,���ي����x�P/&��&  .E�u���u:� ��}���.`Ŗl�m`�qr'�1z�"	��jϷ�h�n�X	m�*3�c|���5��{�A|j�p���"������{�2W9�h��eCQѻ1~u�X�Qr?��qu;��Uv�~6��z	��w2��jáI}9?=9����?�����������g��-�D_����F?Lg@���s��&�m@[g'�S%�8a9�������WNc+.L�v�⊵�%`6s�Z�1p�0kyd)�Y|�l�,Z�'U0P
��`���m��اe�y�q��Dj�Yt=mx���F|Goz��yKy�������P�7z?̖\�������f�`_I�%�=m�������Q��lSp�&�XwM8�R�LNR]�y�Ħ�T{em��4������� �}�Y�I�����w�M�y����_�v?X(7�P��r ��d
�f�� nf~�hn&-�n�r:�v)���L��M+���on��lnڒ67S)�;���}����ne�R)�9�i7��L�J��L�$�M��k���rˁ��KȄ���0m�F$ԜB	}d#�!�������;V����~���Ԯ�V����lP��x�"o����ȟLmĖWgG�;��캔s�	��@�R/�$�(����;y��+�l����:���]��tĸ��t㐒��tSʯ��3�²�k.v�E�>L3r�����g��C���w��6��{;�6���;�L"�v�V��m��j�q�R��+=�>N�.��0����C]��<R��®B����B��W�砲Ga��q#͗��v�߶6=���n���{�.(��e�&��]�X�T������qB$�=���(�������l�fM�ڊ���7"p�K~������>"<e@Ϟ�^�i�o�H�ڏ
/i��;4Q(D�5{ʬf3z�P���X}�f;�K�@�٘�۩~.8=�NpC������"��ė<P�K�*�j��iA`G*7�C;�S�D���T��C�3����Tl)]�I�s�3#��_7���b��S�du��b��ve:rMz���ݩ��0�M���}b���H�.�[8
	�B)� �XA�0���u� n���BD�P����E*��x�T���O4��?|ʰ�<�3�W�3��B���'����[7������3�1i���1Э\@�+��$z�)u0���w�"x�m����#r&u��K/��a����ϧ��[*�N'�&Sl��a��o��+5��rs��%��َvס�]l���Z8+�46Q"O]s��i��B�WP�Q
\�	������>$��	�8Oc��Z���>-�b����Qf�����Uei�r�k�q��X��K��>6��lK��B�����n� _`P�" \����
�B��������#���&��]*&�aث��5�`Μ���6O�<���XOQ���2�s+���
��nx⊕��@R8�\J�� b�׃J��"A| ����1�B{�X�Yۣ�ݘ��U�*cN]mGI�8�P7%a���$z�6�r���m��DB�!d�g/�L:e2if����(�C�����fi^�},��r{��}w�3Ҡ�%�{y��|w��>;҇L�*�~ʩTכ~����i�bZ���R9�S��-�C*U-wI�j��8��%�S*�LR�T�Z
q�I��EQ�O�J$�uQ���L��5�7����z�6��r�����Eb��2�nS9,ɢ��}�H�,�d�� Qɵ�����A���X��qP�@9N���P4pq�Z ��FmW\��������~b��l�;����4q9�q��N��2X����A����$f+K���f�c�;���-��
�����Y+R	�	Y���LYV-P"�U5��M�@k}=>����'�z�R�C�
��W�U������d����n���d����_�����aW�,����;B�k�3ydmKi=�y���MJ=�U�g�6N������QG�)������]_�A�O �c��C� 7 ��S����8��/g�v��� �q��D�m7c���5	e�J�s�\����-Uw�.����j;]�����G�U�N��ȥ㈈��4əf�!���X�y���@Rc*B��ݮ��d��B�7��VR�I�dfߏ����c��V�G���'�T���������8��Ҭ���&X\a���_e]��2�'��_Ş���U�ӿ�\&���V�L~{��{�Q.����4A���4ZUC M1bj�B��Լz>�¾��j~��:Ԏ�0�eǻ��$��,�P԰e�6Ҵ=��ק���"���{v�|������[����B<_�����n� �������p~�Ԕ�R`��zҼ�9���MR���6)�M�5�C*�ד��<I��im��?j�9I�-�K����I�#)�;m��r`�y*�s��HJ��n�5�~t$����IR"�1�ҩ���p�$�&��@B��!�km�B�y&��%`�\ؘ��1����2Ʒ�f��t�t�i/�-���z4�dY֓�E�l�M��--���ӜrH��6�N��q\\W���%@q� ���ʃ8���{��g������cD�����.W�2���旁�FQH�^��wG�n�݋k��}U]�������r:Cΐ�19p�>C ��!P�q��B�0㡋����#�RiDm�h�T��6⧧G6>=9O=5~?�/N	��DݎN>�=�����h�K�Hv{-�\]}Qw�����#����B>��~J�u�`��/y��Mk�-Iq��k�&��Ik 3(��Å��J��A�8�a��C��M.�D�BL��;��_�*>u�&x����-��j�0'��W��#h��-�"V7�O]S�8�g��G���
2�b�kݤHkNQn�YQ�]��d�>u��2��F�.&��� A�ZJ?£8kw��Q{��j.�7ɿ���ktMv����w?^>������
Ѡ���;����5}�#x�@�7݈��U�!�^�1�����1
3�6 �bl+"c���UD�vk^L��:"����W���� ���6i�E�G�r��^�I#7
pʒ��Q�W{VԜ1�����$�Y�,�T�4�����>"S�:�Ú��@�R � �C H�[�I H�EK�܁5K�]�.��]���Mc[�� S��i�^be2��i+cZ�	&R9r�%�G��$ͦ�2Q{�5RƖ�%R&'�C����S��Ei?�2��n5P)�����5�/�D"�i6�ߧ�<ڰ�H#�%p$F)7g=$h�"W8.W�%��P
���ˤ�!2x|Y#K��]�Q�\^ȗ�/�~�jxv�ן����5�CޙE���fћ�B/��
��z$�P2� $���n@���${;VL����:l#���_�]���Ş��>AR@&a�'ϒ�h���0Eo��S!����2�=���l"�&�s@Q(�C�(��r��#}w�#�&�n��w&��B�E쩉�r��2��L�����{�Dt����t����cO��N�S&���5��`OFT_ؓ��;cOZ
���'���d�6�$���<�L��~!�đ�&@"�B�($��s(P�D��n�0`�w�{Z��}z�H�7���7�(���h��-�+��kb�*/3n�y�V�f١̵):�{�3�ƅ�;o��fogwE�f��[�Y4���P��z�,o�a�]�Ƥ�����8,=��)    =x��3u@�b�{D�,M�	G�X�D~(^���k.-{�Y�}�R�M�h�����Q��h�D�����1�<_ ��0
�5�ԋ(T�P��i�j����>�FU�2F�����<F;�����vz�1hŧ�5j@b\Uq%�J7yr�IsST�����Urt7���Z�����s~H(�7����h���َd����E�%fr�'�)��+Ԋ���m�L�Ǧ�`��3�i}���k<{�nxqw{;�-R����KZd�4p�E��Y�a�0E����Q�9H2���TN�~�,���u���������I=J����_�v?XF��B9Щ�P�\ځ������\U8t�����Gu��6tfO5�������
ͿRFD+�*�q|�Q/8V+5��m����&����]z���o͆�=�ٌ�N�m$�v�o��im�R�M��H�胾�I�@�)��B�F�X?�m$���#%��ؔ��5镾��Z%7N��9�ߗ��2��r�q"�6�(4ա"to�<�ZLt'*F���������Lȓ��Z�y�P�1?;�Nz%��QO��@`W�l���$�Z���])d{�ZX�}-���YJ��+�o8g�G��t���Jp�����O���2�bA$z�2pi ]$(���BP�w ���SJw��V�sR�(l��j��2Z*�L_�<7�����[#��6T��S���RM�7�9����0ќ4�FD��?��$H�ѓ6m��?[�Nl!.]&�[��X�ʳ�Ȭ7R���6F��}�̹ۊ;/_�v��܆��K�������=9�5�D����;��)�
�3e�R���E��������L]M'�+?�Tɞ�O^,��/v�a�S�`Ѭ+w��y�wɱ�H۷XM���5z)k1}�� 4Z^��6q�����?�V)2����������[zҼU�<�B�<-G�n��z �bN���<Ӿ��K[J'/�ԅ�#�U�3�(��3�:߿4RmG��&�����Mru&�H�Ǵ1�g.��K��x��E!�h�B�;��%�� �� �*D�t��̫(>�U�=����]�鷦�c�v  ���C7�-�鑯k�卵Y!t(G�}w{kP�����<�}�2W/����ͱ~���k�%��<}
�hݒ^/��+��c5|�jV�m���'ݝ� �w��>��,ؿ�ʫ!����z¯���5Zu��̟L�1ў��)"���6g!��!=x!R\*��|�	��(l����Z\`F�l�ǔw���R=�N�p���`���t|g��ً����nx����h�?k����E]h�M޵�m�&��X���>�����8v`�|���������П�c�hĠz�mb�����[�B�[-'�[7Cl-[q�`��yv��[#����f�� �Z
�'c^$��+FVw�VK��b�5��5rY?���T�HD������LYS9d-�_�>�����d�4 I8�RJ;Ew����.�R@)� �s�QJ���"�tVk!��Lg�Ǐw��_�K���������/��:���?���ƍ
��Q����ֱ��':�5�o�R���ܔ=�k�5��2.N0��1�Z�b?�F<�*�@o .!rC��=N�Z�`p�-����e7m��A3d��Ue)�r�k�q��X��!�G����\������R��;B�����^ �
0U~HX��lY����m��6���}�qIr��Rʹכ�=`m)]�G�J_�>ҿBޛ��z�����s����n�XV܆m���bei�yƨ��Xe���g4Cm]bf�B=x>��\ȃ`�ḳ]΂y�����8T(�|���xvM�"Z�	���[2�_���.O!<��cE��Z[���5���:|�8}i��3CS;H89���֒���Z��@���Pk=,9p<�\H���ݮ�?�ߥ��o�Ϭ�^I�'3�~���G�)��Lt��ѱ�_T]���������"X��6kb���	T_�>��tYy'[+�����S��vyl��rv��ս�b�F��s���;�����芪��-b�P�r��������x<T��X��ס�2��/;�����=��㲎�B%��|pb�ju��K����TPy���!߼��C�n�:`mu�Ӈ��x��W�<m�S_�� }�v{�����#��k�]+R&r䊔��0�&�lma��'�"lR)�s��-i��D
�!�&ŝ"lYv��I���i7�	���aK�QM����TC���������a���P�B�B��w	�0	�{�/��^�������x�#�s�����G:���e�u]���,�:��l����Q��9d�=-����� N<S�N�z�p=w��>��XS	���Þ�iO�}{3|�C�Ʒ��q��վ�|���"5�2�����pwt@�0��Z�t@_CUwg����:�x�B�"�b�Q�)�P00׌5Umྣ��(_�Έ<��J#j�Ek�l�?==2�����x����|qj������'t�a~����y��n�嗫�/���]z`�����O��Ƿ�OI�X�2�%�S:^�/��z�d?y s F ��;b�!�y�QB�V�@�H�\I� �}��#��k���z��|V��99�����=A��tA`�a�$D.v)�}.ⴆt(H�8�]����� �o3� j>�+����ۧ������S���O[i���	�ks1\��􉁹�îP`&��*��T!�Q�n��5�&K��ٻ/������˭Ei���0�֎_��>�7
�z��8h^%B2�)$C(��?$�0�mc2*����2��h[eh�������2,��x_��/�́���M��L _�ѳ�'#��p���i�X&��3�%�����Cve���tl
iU1Ֆ���
Z�Y�<~,�f�(6>Y"��i�W�~D�Xu�5��ǀ,�b@1 ����QH�%[�܁56K�]����Z|l��wN�R:��!\fi{;��etAz��r$�<MID�`~�I�`�w�1RH/�2��.�2ZJ_�2Z��G�T��,��p�.X&k�_:�Dn����O�#����Ht$!3'>��u��B��}
(rp�"@x�~�R�=��x�Z�h'n(��6Y"��@��y����Z�/yW��va޵._���\�>\4NƝq��<*_4.���[��o-n^2���^�V~g�O�ֽz���G,B�; �D �Lib��I!].</x�_=nn��vq�&:'�C���˷߽���,%߽;{s�-�c�:f`)��ٛD/7!��z(=)1�^m���K�$�	�K/N�uf�E�%4��ϟ�?�|l���[o��|�+��z2�L����<�=Y(zcg!�i�TR�'�
}?Э�l֞"�}@����"��m�rך� =��Z|m���]A�{�V���]�� �/-u���M��C��	r�D��#�搻�~S�=�"���s�:@�F���@�(��n� D]!�HJ���Q��kv�res�ݼm��	��)C��RR��A4�B`�G)T�
CG.�/<d�A�Ǩ�*�}���U�lNS>��ד��r�/�4��c���[j!�e3פ��=A�#K�; ��{e���t� ���z �h��W�%��J��J�Sb�;*=)�
�"=xJ1��<?@"��xtUb-_���Z#C޳X߿����o_^lxǤ3�n���+;��^�LsP{Z$�����=�p�mZe���`���m#învN����ێr��}��'ۀ8X9��0��I���iK���W�Ok�A\](:qV�ڔ(>|�|�蓪�)�P(���,?ν�H�*վ��Y_����\*՞��+����-?*}aO��4H�p�9���j��W�[����_��8�hu�و�Ү-��z��A��~������p��A�,>�z��k�{ƮT
��Z��W*��b8^G���,�<�bmL�k���u{K":�6Z�`XӾ[�ޒ�N�M&�k��H�kcDўX#����hU� �  p?�YӤﺽ��~��FnA ����@�r[���L���M�&<�!���C�`�m^@��NPOR��u�3��9�3�a�����0]st��F9��]�]4Y���E�B�s[�z7�,�t��ܐ�H�2�`�@��J
��@���P��9wl7��V_�F�]�+�a�f��|d4t�w3�^�H�� ��[���e�V0�M�S�$��2���x�8�) �<Hu]d�9���!N��l��F=�i��v�pn8�
��b@_��}���e\)y[�'��;]��5ʖRh4���Mx��4��F.[� �}��Z��"b.3���p��酞r6��~V4g��n���k��X�[�O�����-��V��g�ߺh#��P�y�N�G�b�̧�^�*��b�p�ɝ��ś�{^�_{�Yf��p��-�k����U�P�(*w��q�s���P���S�p��Ea���u��0�ϊh�u�4���2��Vn��)��M��K��	lÒ���tr�щ%�ElΒ9N��n�)KjK��$u`I��K��%�dufI#)�Kj�$E{eI#�N/,�9�hΒ���yy�,i��r ��"!#d2�RG � J��#�����O��H+h�u��}�*J���|h�F;��DVr�hn�Y�����Y�`�� E�}ύ���͐�ѦDB&%�����w�t��<i"�B.���0Ν�0��������Z��o��:���c��tđ�f{Lo#K|���)z�׽�F�izA��X�n��o09Uwr�
� lQuw��w�������5��n��N!)��0֝�ΩK	7^yu�0���NH3��[�@�OU=��H<
�>y0�B�,�q C�qP�*}���څ��!ѽ�,�����a��,(�+y�X�$��꩕��/ٹ�r��w=ؓJ�;۵��|T�q���Y�@�<uk�.�a�	���4��C�<�O!P���$��G��_�[T���TCY��7�ߟ%���o�O���/��m-&�s�uR�P[Jb�@t�j��=��]�O�Y�4
Z�"?j���2@���������G�Oh1sr��>����Ț���"ƅ���bᤙ�E��/��E�����fs�4�'��4����<�G��4qc��1B�Z�K�?j;M�k����6҆σ�b�<������Ht�Mz�����3�(��C��!��Ż�:X���\i���1~,�k*�'�-VS��~��Y� ���
L����.�!���*Efѳ�"�D���vX�(�9ɭ�n���$���-Pʈpz��rd�$�v���,)��2I]��Ƈ�$�D�����u7��$�B�@��I��RFnO�R��`-�x����JE�-Î���29И�?� 8�0@� !IB7t��]+��q$E9Rj-h|��R+L�� ��F�ݱ�����U��a��,�Zf��=�mS��e��͈��PH6`�E����)���@��+J�(��ݽ��_��w��j6�s�k ����O�#'���9b|�kZ�yk�+dҽa��f䰻��ᵌ���Ʃ׹M��S׹|Y�EJ��HwX1@!��p�!�) \_�5FC(���sFa�l|KŢ��k+J��c�t-Q`wYI4�BP�Z���ׂ0��K���2T7�ė�js�zX�tFʔ)�G��)3x�#O��Z/L�·�}f��g�
�l,{x܌�n�-�.eq�bT��Q1�ui�c�t*鿷����챻�����ozvt��t�T��i��@f,�ު��i�\~�DfDrH'2��9�a����������.dFNR2�h{!3"Q�2#�ź��ъ��5��0r��0��u1=M�������j4�n.'�?����*�#%Eb%���TP� �- N2�!.q(��S9�x
*����j)��w�OR�曆��w���"���=��l7���`g��Z��0[w���������[u��H�H���?��?�?C��            x������ � �      �   �   x���=
�@��z���e��ٝ�!<A@�4��F�J�"��o���#;�(�|�%��C?û��g8?��N�s<^���W��117@��cna�I*c�����_ZQp����L-qr�F��5�LW��R͈�m3-y^��겦5��\�UMu~@x3�ڂS.��kzQc�b��Zu5      �      x������ � �      �   �  x�M�ˎ#1Eו!����ـ�3�I:R'���a���Βu������*O��D�ǉ��)Če��������gܞ��d�JU��Ҡ׵�.9�u�W~�u⮻�����+;���c{��(���g��V��|�K��ݗJM��/�7�D��B�J ]����D�������~�im�j,dy��X��B��l��=n���}Ț+��ArR�c,@Uc����i�8dq'i�}��`<'p�wa�Tt��~��C�=��V�D*�z)K�A�ҩa�0��{���ݢ��6�[���r�Bɼ�\���P�V�`r�Io���qX��DR>i��K�����f���N��(�`��c5h���*�l��/��,�����=B��^ef�W�^�ey^��Y�Χ��?�ŵ      �   �  x�5��n�@Eѱ��e�|o���	�eROh4n0���6-1?�^:�Je8"}&��BA�"��@}b1pG!#>c� 
I����0:*0d"ig��h�r�M���W%�v��f5�N�?��U���E�����S��y�-�:���h@��m9A%8Q �X�#Z����*ge3rZ�$0Ÿ��?%������􌓗��g� �bj���ů�wg=���v��:n�����@J�`	 w)��q!P�r�c"��Ș&t3�Dʉs�Z�5WO�q��ӎ7u1.İ_����V�㼴��+w���2깽������I!J��m86�Dx�i������H��T��2OPbQDR1m,�����ga6���;�T~^�3�*?,��ڟ��=g��.lkj���m'޻���3m�Z� ���J      �   r   x�̱1ќ^�i��'t���s>����=TX�=D8��S�pǢ=:q��:��Y�7]-���g@5�g��(R���9��0'햸�dѼ/|���5���}?D��:&,      �      x������ � �      �   q   x�ʻ�0 �ښ"}~ >B�%��`��o�|F��\ f>���ȉj딋���ŀ�$!��4��
Q�um��.(�|D� �B�`>W�ށh|zH�ž��w���d�"�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��\koG����N�6E����xly" �����`f`�S�"������T���63��(��Pbw��ު�8�����Z�""pI�όX�1��T�ܫOL�N$HR���%��BD��2V�r�b�V&�BtDfQH���U")E��S�	c�����v�q!���O~�l��}��|�f�'�Yڟ}�u���b���w~xx�ۃy�^�?��7�#��G�����@�t�<]��TZ��تJ�'����Q��*��_9-,���3���>RE�S�f .[M��\*�S����`Լ�x�ԟ�O��)F���$��qd69��~�'�it>�:r>����G~��pSXd�do4��	ⲕPH�D)�J��t1�.{_�4Gy�����?;j.F��+�$�,�&��1O���S��xڟ�����VtWFHU%.dEd�j<I\d#�aaSݝZ��R�������f�Ǐ��G��lGPJ�q��{F��㓋NS� ���$�������tx��?�c��*���l�_�~ɾ�1�{��C'9�06o�=�;V��I�&�`�A$���:<�i���>i����e���lTM�9��Y5?=�ۅ?�����ģQ?��7ק~
%��O����`P�\ꪺ����!:8���^3��(�>{qe����N�뙷����us�/G������'���%w�������W|O�i�����q[\�&�q�����h��U*r��z=-h1.RR╴�\�c�Zu�!�V���qډ���i���㷓<\��c1�T��c���o�~���t:f���QÃ5$�
:&	��+���<n`��'L�l�q�gM�C(�Ʋj�e4ْ��=��˨�g�|׌���6vy�����Y4�X�^3����hp�����N�M���i��k����o>߸�=��e���&����H���,��")��<���\(~{F�w��	�:�m�A��i�}���'�5{/���ޫ��GD��:+pG������Y���rm���"��n��_|ڴF~�G�wʤy�>�gy[!�?��@;p�憁�#z���R�~� s�1�N�w����s5?�>b���@&8�%M&��vMC�=�n���A��ݾ����'/�s����=�v�cB4��̉L��-#���6Y����W�#|W�[���g�'1KD�1�xQ��O�D�6*j�X�\ޛ��X<w�[X�M��܊�<�X�Jg]5���g�S�0��ԊE���[?@��NF�<G�#�7��kڄ�>�N��NF��I��Ɠ�4O����ˢ�����:!��x<�g���*�`;kSps��ڧ_���o�v�ٓ�S>��w�piX�����}��d�S�S��Vkx�HwD�Z)%��pJ��N�ڶ�Z��=&:	~5;�x��}�j����>98�=h��qZ��(i%p���8' �R*�\h�f}o�&\t�d�,?���
L����F��6�DE$�{�2���Ly�����Fz)gu:�V���"�͵�{|}�.���u�%�sM�4��T�}}�o��������׌���矾nNJ&��W��{ nGp���q����Bɖ|��D�`���� ц�\tR��`M��=��M�Zy�>��s�z���u�|��(+�)F���xE�u�dŠI�H�k��su\��2�
X�^,�>(8{q�q+��$c��k������>�^w�w���/���%�vt^�>L���p�ڬ�O��}����a�ժl�|�}1�uu<�Ym��bo�	��㒋��<z6�a}�Y߿��K��#�ec��N�@�A[EJ���gs��upד��`���[�����G�� �CnL�sdI�SV9m������Ƨ~8!��B~:������l!�名r�/�=q%9B��ڣ����|r�Ci�u�
�g�d!@�����50�&
WbB0�>x���0M�#B�֔ǭ�:C���OU���|)�Č�1�i�hQ⮒t)������,g.@�]�O�w<���z��m��6#h��]��\袻��{C?YY���� `p�! ����,
�uq�v�B�?*�$��^[ODR�	V�x	��E!�BV��F��=�Ow�>�htA�C5]���J��V
�r��;��W� ��v�'e�S�'�V�"4<�6�lT�2�״Z�w��1��Y�"'�Y$�WI��|��Ң��έȿ,sTL�5�p�G��1�b�m	D���)-i�\���VAS=��]nVR *�Q�Px���#f��*Q��D��@��N�[1��/b�\N !bj��Y^3'��X��s֣���ȸE�S���i]�q 3�b��Ŵn.���n�s��6�"Y�c<I�Tk��*~ݖ�B�.y��g��1���FT�ÒP�7ƽ��&�����ʖ=Pn�~�@�u##�J�@I���R2)�����[���G���mQn� �2�����+xbq�&��@8x��q}ǔ��<3^8�0 h�<0G	F"�ɔ�h�@���7�=׺R��3	Ӟa.Ή�5],����h�!�U�-+U�u��.([Б�R�S�.�#�#��>��-�<dM��H�AfRLJP�ش.����>n
rÕ��g`�V$���
-��!�h)k:��nJ�{�M*��u d��
ں�9M�oЬ��Ju���OG����������|��To��^;��<�5�E������E�ô6>�&��ù�����}�w��6��;���'��������^L��N{�����9��C�L�������q��Z9�hB���h����?/��z;�c2��A����jm�%��,�2�bٷ��
�#x�s�)���Q3@/_Wu�D�eΓ���^j��Z�Uݳ���':�R�.+}��$VA�a1s!Y���*��Q��O42��x	BH�Fhb9��Gʋ]�]�"�+�����եDR������K`�6+�K�Ǥ34�≖L���?�9��4�.�����;��x�k�e�s��(�"wV0[�_qJ���n�����Yf�IV�����Zg�� a�`f���\���v�ȵ�L��DFb.Q�ZV9	��Z��ӫIHD��#��P��P򬐯j�J�dW��iEf�y�S���c�*U�� ��0�.k$g�l���]CFJ��a�G���r�%\}o 4���JPG�"8Y���F��lg+�h�0�BC%2	>d"�ȅ%�m/���������j���{T1Y ��2��C�r���`�����wC5�h�FB���<���i�J����V�Ak��RM��R� \qu�2ϕ<K�.hw�[�ؠֆF�.[��@6��ɦ 3��e���Q�{�4��i���.l�ծD�v��V�&y�TQ���T�Ⱦ�PZ�����.��"�m�M�h�2�d�`�H<��s�P|�9��.e���dӟ�l*4��U!T)F���6fJ��ug��iU�eM�=����=��0ڸB�gue�G��\���87���\��韕m���wJ6}��"�T��L�u$Eh��$�}􁚜W��u���k����Mƺ\��WK}E����,;+��:�R��������M���5��B	���C� �pVlݶ�\�] �=�IefD�x�'���6�D��kQT
�B��.J�W�)Jc���J�k���ڿ��$;��i��k����M�c�]1��v@���p�\�e��U���n����e	>�s}�A�0vn�+����+���s�I7=&�v�&x`���%&I*�_7s	D�L������z��B����ML�\����Dm��VGb�κ`, ���Jo���x�ų�$���V�O^����Kۭ�4��w���n[oX �%sT�^fἾ�y�z��)]ֳ��x�
��-;��k6}��ړU�2PK{�KN���-]�m�Lta�k��1
���l�<鸽�r��]�^>����z�����W��ʥ��\��k�$o#
�:g�L�t.��0�N�� �Ne5wP� I�/N4���� � )  �H��׈��^�nr3�t�2/=����v/I�q�B-W�� Rx�Q��,����&u��{�������I��^f�G
��/[�$:���u���η^��'��`3Hm���w
�������B�ZJJb��sMTw˶)8g���2R����H�6n�֚*F�9�j�l��b`Va�.�q��[ˣ�α=K��!'\)p�&�rY95�O:h�=tR�L��bE�"��ߺ�G�U�FX����W�2=�;����q�������7��.W����R2Ȝ	M}ᒮ@d-�h��Zl�l��{o+�qn���C^���n�f��~�x
���&(�lw|���O��ݿƼO�9�VB�ڏ1G;�ܬ��_<��X���o?�#�5O�d�/��Po�*�����!_>���7����{���"��HNQ20OlH�*u
e��j������fl���j*�bU���UnH��R�����xo6�����K"���?��M[���y[��ܢ��|���:m�M�\70_f��ݰ�n��W�ѣG���>      �   =   x�3202�54�54W02�24�21ճ42�6��V*K-*���S�RP2�3�3U������ 8b�      �   �   x�%�An�0Dѵ}�)$����dC�$`�I��	��Wh���X��NLZ��n�ZKCk�=纜�s�%V.b�ݑ�pKlH��H�z��2q�9�7�j`���S@Y� ������y���u<>gI�%���������>�Ͱ���/ӗ��>gs�X��b�8�      �   �   x���u@!��^�CYEz�D�/!������;ˠ����1��@^�c}����E�Z���V�*[̉��l:�qw�	��c��l%\\�}Z��X���%����Av�(��$�W���ލR���y�9���?OŽĮFP�$FM��}�j=��w��%�L�Htw��|�O���������`�|IC������ *;L;      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   J   x����0����%�^�� �����3N�#Y�,FYs�?�eX`yi��jc�]�p`6��v`L���D�J��      �     x�e��z�0��c����ɚ3�7T��R}�$$��V�E��2ǽ��]ߪ,v�@Tj�x��H)dp��P�1�Nɝ0�Qd)!�s!#�(���Q�����O��~2��ۯ\5p_g�����[6�u}���̅>��p:}>����o��AWχ����b���������G�т��z}`4 L$s�!Mi�8X�� 	�HI�ڱ�T8!�,���@c��)�22��P���6]ɡgb6��c2�=���u߷y1i�åi���a\��� 7f��v����'��j��'�Q8��qw�f4h��RQ+��M�d��S��\X ܉��ܩ
�2��֬�jOt�iED{��m�=>�M����[�.��B�j�5Sۥ�������u����<����ε��ðY����÷zH������^��c�E��朁m�[.W�lZ�H�JaM�v&�bpC�h�_�Q�e�X�蒋���|����_ٺ7]��~��TQ�z�^�����^N9}V�!�Mv���b��i&��C�@&�%$���q{��>A�+�&      �   �  x��\�o�8���<� i����C�N���qڻ�Z�m6��%%g���P�(9�%�ʣ_K$�3�9u1�w��\0�I�K"vˏ]:"E�#��Nǡ.�sg�K�U�?��!�g*�*sk8VL.�$w��."�P�P�aJ�p��jϩ��}�8���xܿ���Y���@�p������h?�5n�*C�x��>k���"���8�:W�:#-�(�ܬHɵ��Ɗ`Z����{����,E4�i�&�����UE<=ˈ�z��f�G�Ƀ��3"߶�{3�!wl�nLs�Ǩ���9���Qn�T!����Kl;4�.Q������Q?�l���qD$S����
"zh����G��d6e+;�%h��79T!�( ���4��w��l=�AGSU)4C��+�U�.�˒.g�p��T����1o�@2�c�j����ۧ῿6��?��}�����\��N�z��sy��)w�q�j��Z�9z*�6K(��8�6�O��}:9��?��"�Xrv�u���%�\���*��yvvp�:=:�Z�נ�Mު�h~�P�x�	�'�4��*��2��(:_3�b�z<�uY���O*H��FRr'�yz��)�w��H����tp?�����l�}|�u;(��p�3��#;��vpx
vpx�����I��T����1K��51��e͗������s�5ݰ�4w�pƌ���_�b����O�-��R���JƫO_5F�ȗ�S�T2�sG=�� �:pF�"�*����{�:�5�Hǝs�����7�!3�v�o;�[���	 7�k:��<d%�L~R39�>���w��SJ�?�����#JAH9���{M�2������R8��b+� �l�ʮ�m�燒���g���`[3�H�^��*U�g��Ϧ�F���^2�[	?3�U�z<#d��7̙��ӭ7\�D_�h���`��U)�lD��j��HG�q�,aR!f��(�����<�y<�Q8SzBpU��A�09�
W�U�1�����P��CF!�g�����͑��RU��9s9��?�M4�Y������轶�PU�g�ּ�����3ku��7f�Am��-0�pư�}��!R/�E���.Ѭ�D���ҙ��PzY0,S�B��
De(,��|FM��=�q5{2U	?7P���ԝ+$|-���j��{<ྨ���_#��тHX[��V��NU�!�Q,��j��
�H��:�%��`���k�3f����#��5{Ř��ܼ����h�,�/�T�&6�ImՄ���L�����}�$>l t.oz-#����`�C�\P�|B�xȊ����x�b,���U�E�ܫ�u�^Z�es��Y[ɢ�zsB ���d%��,p��2�f����Q#t�ǵ^��m&���V@�U[a��.}7R`��:^	�/��e�
t�Rj�n�U����E$_��/���Z�Oj���g�%��&�
��j+�\��8���@�P����I��+O�/?�<��>K��W,JP}Jga�����~ݢU[٤n׌���/_�]�j��<�.�!��[�&,%a�JWX�v��epu�%�����6
q�	��$���`�6.��>s6�a����r7�*�1.k+�������q!��D)���QE-���I˛G>�r���s�����AY<�������Vm���H�d0�z(�N[F�ud�R�>�,
2	S�}��)>�e��#[9�
}�R,�����Gڣ��szRk��,�vTz|���h���q��᎐/�D�s��Ʉ�]�dT�-����
*��ܑB�IH�����
u�n��l�,�k'���o�:#����ӧ�[�"�+lu׊ho�0:W��䫲G�or"�kO�b��]�)y�����v�M�0>���c�	h�-t���p&TH2?;��M-���6%�:�Y�&"���=|:�>�#��G4�����A��
Xa�I@�_"����}�ֶluໄ�&&�+l76ɉ�\�;�]�[r��0�����oh�j�U���8�ӣ�!	]H��
Cн�hlA[��	Y@sY<ʏt�$Ә��� �9��Ğ�R�\ �~��5��H0�z�W
%�?$&qM�	��W���6�Ʃe6'�	%�F"ޚ�Й%z��$�y�1�d,CL���C��S}�p�}�כ�g���nF�#�)e�I{�w@ςǧ�H)�"d�	u Æ��9I������m�|Ȃ5C��2�W�q�=Z��%�yE���O�x���G�o|�ϊ��X1�wXu���8౹R)�*Q�V����� Me��aW��I���fTb#��%]r�<��;��}����>�������đڱ�
�E�U��� ���ج���]�k$ĩ�ЬE�J}U��K2�u`%�@t�O;㹐%�;�?'�j[έs,��fG���I�\Q A�"�z�>�R]�O�$����Yi��t�ϰ���{�Y��jay��;�ӷL.�-���-gǻ&S�����=����'��L�ݍ��ŃC3�?��N�zas"^&�!��T:�Q��=I'��ٚO�Ɉ^�O�l%���t�L^g�|�^�ƶ"7J�_��͂A��lP���q���e�d���F�eҌ����Ze׻������⭘�Ə�e��!� �BPal]t?<\�S,�^P���]L���9g�թ&�KMW��#"
a*��ꍸfmL=
��PT\b*���e�L�Б�08�(TY�r֛�v�Њ�=�2�e�H���=����q��BsX�ߕ'9�A��ހ�J�����wl�x�@3,�$�H�4�b>Ӯ�8���MR�9�#����*e�8R'�^vo`c��*�4�7����W7�4��N2O/7�;_p�@�b��G���zU��t��U�2`���HV�ɒ�qoA�(���ԁ��P�M��´fW�ws]��b15��SB�5>��w��[�=�Ц0�0��a$w#i�&��|u4��o����͛�
G      �   �  x��\[s�J~v~ż��*����%��N[���rR��n�i�Y�V#A8�~��"�@I�T���ԟzz���o�.[퓃o,d1� �_��������΢T���)���ٌ{W4�SIn��c��0���I�PE� �	�p$Y<g1�sJ��b�~&��xp9�%<��嫒i,�ɔ,E��^NFK�{�' �@�L��K�%��,�x�J�������4I"���c�F���#?���ӣhz�::�q½��^�~��a�/L�"��"�"�q��2�c�}r���c�p��E4,xb��*|��@�9$Ă�m����O
��$�j��*�G��F�S!|�o)�YA�<�ЌԢde�$[$�"w��<&%�3�K�\6B��s�8��C� "YBfKkh���G�}�(fcx�lq|����-���EC�3*g�*�����R�>�@��70��<�:hČ��a�UiO(�E����kz�Y�9�;Ĕ�Fb1��˽$��jc@�,�������VE?�u�6����y�H����/2���ơ
�4�6����	�eN���g�]o�9�%�)"�BG"M�ۤ�����n�d�X��hĎ�oo����%�d�������T��o�pf���1�|����ot.�9�Q�q�O��w�	xz+ ��B�kx@߉{���S"bx��_�H(���1�y�8�lBc���ksH&h���$f0eL���b������>�@,b���0�(J 1/;=4��CJ%q��U�p�x�z ���i���kv����\st)�W
ӷ�"�r���# �4�A�/>��b�J
<%w2�QʃPۺc�Q�ky�v�).��CD5D^ �J�#�A� b��&�dQ4�ms����������!�w܋���cd�ݳށ��%l�&X`M���zD�,Ι"T�'�/xDS�H��L�|U�:������*`L*��O�\�t�v'����]F���fʰ�����%�.q�ۀ�5�q�9;��Cj����ѯo�n�7!&�ά�p}�&���K�d��m��#��ݠQ��Vb J��}����ȼ
e�p�,ۄ��j�Β�x2�|��#�Y?��:vW�)�IS��q�AQ��V����:��љ$w��4?U�,��ΰ�|U�&�濠�)���[�H}8�.G��j���w6�U�J�-��XU�n��GH�}��#3�������<Gc\��[=5"���Gve�g�wt�p�m���[���f��^���p��f9+��F���}�"ԩC4� ·��H�-�Ϥ#� w%e%\���נ���"��R�7�B��T���r��y�E���MR���E��t���[�*j����e@�s]F���Yy�T2
���5�x�٧����]|�g4�x:�O8�G�ނ��K�荚��*Q���Q�FB�>�@�x�&�|b��X��K�D�8�LT� �#y��RL�\� ~>��U�{ �(�r:��s��	;��e��cS�n���\�ۄBl���x�@��y�m�?����j�p8&?0>�sfwKa���IWb���RW�C���}e*n�lk��%cF������C,reK0f�75�0�U#�p��Q�7��"��}��	?D��i��?���Z+h������ ��R���+]�@�Ef�O&�gKGg���D�����]��t�3JK)�Js0f�i:j�F��w�{�.�ґ��\U).��_�M�6�MÝ\�� ��Gm}8�g�\yN�z��ċ�D� x��0����/2ԧ��(!���aw�G��im!5���*%�o�A�T��A*M��ET��D�@o-j�۴ԃ�Fo��%��l�E�әz6�Y��b�N�c'�:�����*�('�f��ˋ$jSe�uRݍY�4k��<|������qp��R!nQ\=�'M̶�&?�Z�����Ǽy>�L�e[V<���!�R8������u\Х�%�n��(Y��дėUvn�����Xl��(D�*
j�����u{��(�2�-�8Y\}f~�w�Pl
� �Eך�4�Ŧ��v�#�p0JG��W��ã�E��%؀D7�t� oE��S�?���Ԫ�9|\�@�9�je�6�����tX��I�@���;�c��rp[�
_Va-߳���W�Vz/���K����Zx*����ɆJ1��E�Z��5�8��s��+Z��\���Q,0n7�*v.��ͷn*��Þ��<L�f7-�7���'P��űخ�Ԋ0����$ޣ\ұ��a�(\�x3!R|�:�ٖǊ���Ɋc��ϊc\˹
"ۘ�6�ϝ�^!�V2ܼ�l�k������9�y����q��+T��۠8s���d�jK�Da����H����=to�o��ڨ�2��om��=��GkN��I�9�T� �9{��x�ʀ�*����@fun���͵v<N����I�u��N���J���X�5�� ��T�&�wd����i]t�9:Uf�j�c&S��� k��pa>�˼
�6��Xz�";<�L��呡 ��3r�F3����{��M�vgR��Y�u8�BF��f��F|���v�9?�q�N%��2�g�T�2o����]�j���pw��53a��t���Wd��X��	�Qh5<,���o�8��7QA}��t�ħ*�D�-�B�p
m=p��y���G�������	A��6d�p�g��a�И�E+�ʺ��:}t�dDUƏ�`�%�8W�7�����Ls�q�l
)�G7�)�����`��݁�IreL�g��be��J�����Jw�g�|�4c�ې�-�+|ٿI�d�Q0n�t�so��S���Om���� 0�E�M;zs]{�V��:�hF�7�=��`"�H���?��B#FV�$���]��q�F��#�J$Uƌ�@b~-`܈wX�?;�1v׮\3A�]FpzN��2z�6,���52�����H�S�k}U��}�9�2���7+#\�Pqt�-�L�9�8��lRm��҉��i�v��l4�P7�2�;s�_c�ϝ�W�~z~���&�WW×�g넯�P�E�V����T��B�(�Ǧoa����I��r3v��M��}	��û��Y����.��Q��TX�Pk�����͈��A��|�ZH�l։��C#��Zf�,C �a��0��6�w ����au7k}u�1Zm�������y0�_o��lL� �8�o���قl��ۨ]������fDv��z>���d����Z�In�y\����fv�bHegdJU`�jnak$L	Ğ ¬�������U�ʟv���Zq�S�x�J�A�ی��!��t�؁!���E�՞�}�e����g��됋n3~Z>|j��v��;��n3�Y��;�56�][�xR������f�����!]IN��''�Q(ײWg�e�ی��ã�3������ÿ�>|��lEe%      k   �   x�}��N�0F��M7.�Ja��3�ge\�ͥ�2M�5�E��n�\��}ɑŁSa:c�ng!'Ӌ���g[wjRm��⋓��3x�>���Ò���'��O/Ϗw�V��@��8�K�"�����#c����>�/,�?L����&1���uǈ�K�\�,ad�cX�-�+�+9�'���+�R�����n!���4�솶����;u[���r�ʲ��:Wa      {   -  x���r�@��3�
50��GLK`��2�
�(����W��]��]���� � !@�@H���2�֨ܥB�P
�m� ��A�1��'C�^ll��vUNa����4����ɜWS�_nx�OoeR|nE$��$E�j:˳�{3Y��rvެ����p<;�q�i����U�	��#PFp@qJ *���Vpv�9sWvپh8,11�%u�'c���h�(Ǣ/o��ZZ�(#ɱ�wX}F��v��b�l��fI�m�1�N�!$�9Y�{'�����u4e{���8���:o��gBI��K���RA
��ZsC���4�w�S�ƴ�X�LĀqj/����'���%Wg�]�ޓ�;+�%Na8 �58/�et�<��B'{�`G���*Çq�n��`]��3���o��O��"k�t��{�M��$�&��i���} }��1繬GQR�Q]Gkw݌�����񜴺�Ɍ{�W�E���q`�5/��S��/���Z����~m��i����ŧ`���?����y�]k�-�}Z����f�?��ֻ      p      x������ � �      q      x������ � �      r   �   x���OK�0��s�*F������[NN�NN/�JfR[ɚ�$H߻u�^��ݿ|x�W7w���b#&�^=�}*�����i�4�?9�D���ί���Z��>ɋ�U�ɶ���{��.�qkp[%�Vs?��  J�ה	 "L�Oޢ�J�hg}�����	�Wʁ�32��?��n��ʘ�I��~�����'���?
~H3��|�t֘b�v�$h���G��d�z��8~t��?      n   /  x��X�n�6�v���U�U��	؀�ɰ�C���*F�m��T�v7�f7Cw��ƀ=ʞ���C�q�؍e$�K�蜏�9������p�����I��t/�x��9�8$F��� �#����n2�b(��Ř��7���U.��~/��(�5:c꒩������)ͥ@�þ�=䠗�Jd�rS:n�_�poN�24�������|v򮍍V�7��}j(��*C�^ey�Fy���1�s������5�<����l���j�7�!�Z�M��}����߈
Z�/6^P�G�U�9Zk��V���r��bc�,��Jn��ʮh=��17�`WfS\�u#Jh����,�fS�a�؎��������D�KV3a��kzQ��_*I˂�m�I9���'��-��$n^�Egz�oD�l��	5�+踝��V�V���F���@�oON�������A�����M{�a������Ÿט���b�@.c��R!m<�PɆ��L�ܱ�����l����Ǝ��M���m�)U�f���TIT70�1�6	��E��52c�����?��}�Ϡ-�3�0JP�???\�@�Лׇ�k$����Q�X�ѵ��D��j�C46f���V���Xj����bt&k�kT�Y�o*�{w�T5�5���q��  `(���_��4�
HK�]�H��z����LSr��ԋ,~���|��x�8"��(�:��EyX�Gd�s�������`�e5���#�1����D
X�%�u�UV^�  č��m�5d/6�|�Ay*�����lU`�n5C'^�z�@&�W;�sO?����fH5�.�]�Fq�0 �ϺWL���)��}W��lkl�_���O�� H�4P ��-B��hZ��v@��%�U{tSce��_k�@���p!��R݉L�5D���4��B?5ւJ�a����_�\  ?��x��t��UJ�կ�t�W9�Nyњ���-�i�K����EN���Q���kz�\yY9�;�|^��n��i�rU�
�a{�f�Ja�8Jn��,������@)��p!S�hżf���m�-0���CD��e+V���Ya;0�U%�6��b��������w�'�X�������\$i��8�#�GA�G`)zG��f����Q1 !8��R�:qxm�z�#���+�$�#a��	�����1�G��㽴�-p�Oz7�X�ݴw����ۻ�pًg/;	;�zg-����� �f1z���,���q��n�-i1��>vӏq���1/�[\�Nr˘������P���P�;;;�W�-      i      x������ � �      z      x������ � �      �   �   x�}̱N�0�9}
�����v:�L�r�q�����)0�����7�w���EΫX��rܬ5�>�vm��m8���$�^I���%hMdȾ��l�(-��"3GV�*Q��b
�h��\9�^u�Q�s����X��T"�KUG%��R|e�;ڿ� 
�bU�vs}��m~=�S?Mu�	����_l���mw����	�qș��O��0�S�|���^��� 	�W�      w      x������ � �      h   V   x��J-�H,J/M��I-vH�)��KM)�+�����,�*J,�HL����ꋇ��c7� ���<�(�3��$���D�%��B����� kb,      t      x������ � �      }   X   x�˭LI*MI��M�/�t*���*��H�2�u�.�4NOK	ͬ�L6MN��0I�5LJ��5I5N�MJ�0׵0K305N2611N����� N�(      m      x������ � �      l      x������ � �     