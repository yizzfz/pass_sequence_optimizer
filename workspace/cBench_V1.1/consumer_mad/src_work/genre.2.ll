; ModuleID = 'tmp1.ll'
source_filename = "genre.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@id3_genre_name.genre_remix = internal constant [6 x i64] [i64 82, i64 101, i64 109, i64 105, i64 120, i64 0], align 16
@id3_genre_name.genre_cover = internal constant [6 x i64] [i64 67, i64 111, i64 118, i64 101, i64 114, i64 0], align 16
@id3_ucs4_empty = external constant [0 x i64], align 8
@genre_table = internal constant [148 x i64*] [i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_BLUES, i32 0, i32 0), i64* getelementptr inbounds ([13 x i64], [13 x i64]* @genre_CLASSIC_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_COUNTRY, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_DANCE, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_DISCO, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_FUNK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_GRUNGE, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_HIP_HOP, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_JAZZ, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_METAL, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_NEW_AGE, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_OLDIES, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_OTHER, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @genre_POP, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @genre_R_B, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @genre_RAP, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_REGGAE, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_TECHNO, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_INDUSTRIAL, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_ALTERNATIVE, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @genre_SKA, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_DEATH_METAL, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_PRANKS, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_SOUNDTRACK, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_EURO_TECHNO, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_AMBIENT, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_TRIP_HOP, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_VOCAL, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_JAZZ_FUNK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_FUSION, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_TRANCE, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_CLASSICAL, i32 0, i32 0), i64* getelementptr inbounds ([13 x i64], [13 x i64]* @genre_INSTRUMENTAL, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_ACID, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_HOUSE, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_GAME, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_SOUND_CLIP, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_GOSPEL, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_NOISE, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_ALTERNROCK, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_BASS, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_SOUL, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_PUNK, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_SPACE, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_MEDITATIVE, i32 0, i32 0), i64* getelementptr inbounds ([17 x i64], [17 x i64]* @genre_INSTRUMENTAL_POP, i32 0, i32 0), i64* getelementptr inbounds ([18 x i64], [18 x i64]* @genre_INSTRUMENTAL_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_ETHNIC, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_GOTHIC, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_DARKWAVE, i32 0, i32 0), i64* getelementptr inbounds ([18 x i64], [18 x i64]* @genre_TECHNO_INDUSTRIAL, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_ELECTRONIC, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_POP_FOLK, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_EURODANCE, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_DREAM, i32 0, i32 0), i64* getelementptr inbounds ([14 x i64], [14 x i64]* @genre_SOUTHERN_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_COMEDY, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_CULT, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_GANGSTA, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_TOP_40, i32 0, i32 0), i64* getelementptr inbounds ([14 x i64], [14 x i64]* @genre_CHRISTIAN_RAP, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_POP_FUNK, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_JUNGLE, i32 0, i32 0), i64* getelementptr inbounds ([16 x i64], [16 x i64]* @genre_NATIVE_AMERICAN, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_CABARET, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_NEW_WAVE, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_PSYCHEDELIC, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_RAVE, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_SHOWTUNES, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_TRAILER, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_LO_FI, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_TRIBAL, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_ACID_PUNK, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_ACID_JAZZ, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_POLKA, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_RETRO, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_MUSICAL, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_ROCK___ROLL, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_HARD_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_FOLK, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_FOLK_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([14 x i64], [14 x i64]* @genre_NATIONAL_FOLK, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_SWING, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_FAST_FUSION, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_BEBOB, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_LATIN, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_REVIVAL, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_CELTIC, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_BLUEGRASS, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_AVANTGARDE, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_GOTHIC_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([17 x i64], [17 x i64]* @genre_PROGRESSIVE_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([17 x i64], [17 x i64]* @genre_PSYCHEDELIC_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([15 x i64], [15 x i64]* @genre_SYMPHONIC_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_SLOW_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_BIG_BAND, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_CHORUS, i32 0, i32 0), i64* getelementptr inbounds ([15 x i64], [15 x i64]* @genre_EASY_LISTENING, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_ACOUSTIC, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_HUMOUR, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_SPEECH, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_CHANSON, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_OPERA, i32 0, i32 0), i64* getelementptr inbounds ([14 x i64], [14 x i64]* @genre_CHAMBER_MUSIC, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_SONATA, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_SYMPHONY, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_BOOTY_BASS, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_PRIMUS, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_PORN_GROOVE, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_SATIRE, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_SLOW_JAM, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_CLUB, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_TANGO, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_SAMBA, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_FOLKLORE, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_BALLAD, i32 0, i32 0), i64* getelementptr inbounds ([13 x i64], [13 x i64]* @genre_POWER_BALLAD, i32 0, i32 0), i64* getelementptr inbounds ([14 x i64], [14 x i64]* @genre_RHYTHMIC_SOUL, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_FREESTYLE, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_DUET, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_PUNK_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_DRUM_SOLO, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_A_CAPPELLA, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_EURO_HOUSE, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_DANCE_HALL, i32 0, i32 0), i64* getelementptr inbounds ([4 x i64], [4 x i64]* @genre_GOA, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_DRUM___BASS, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_CLUB_HOUSE, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_HARDCORE, i32 0, i32 0), i64* getelementptr inbounds ([7 x i64], [7 x i64]* @genre_TERROR, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_INDIE, i32 0, i32 0), i64* getelementptr inbounds ([8 x i64], [8 x i64]* @genre_BRITPOP, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_NEGERPUNK, i32 0, i32 0), i64* getelementptr inbounds ([11 x i64], [11 x i64]* @genre_POLSK_PUNK, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_BEAT, i32 0, i32 0), i64* getelementptr inbounds ([22 x i64], [22 x i64]* @genre_CHRISTIAN_GANGSTA_RAP, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_HEAVY_METAL, i32 0, i32 0), i64* getelementptr inbounds ([12 x i64], [12 x i64]* @genre_BLACK_METAL, i32 0, i32 0), i64* getelementptr inbounds ([10 x i64], [10 x i64]* @genre_CROSSOVER, i32 0, i32 0), i64* getelementptr inbounds ([23 x i64], [23 x i64]* @genre_CONTEMPORARY_CHRISTIAN, i32 0, i32 0), i64* getelementptr inbounds ([15 x i64], [15 x i64]* @genre_CHRISTIAN_ROCK, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_MERENGUE, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_SALSA, i32 0, i32 0), i64* getelementptr inbounds ([13 x i64], [13 x i64]* @genre_THRASH_METAL, i32 0, i32 0), i64* getelementptr inbounds ([6 x i64], [6 x i64]* @genre_ANIME, i32 0, i32 0), i64* getelementptr inbounds ([5 x i64], [5 x i64]* @genre_JPOP, i32 0, i32 0), i64* getelementptr inbounds ([9 x i64], [9 x i64]* @genre_SYNTHPOP, i32 0, i32 0)], align 16
@genre_BLUES = internal constant [6 x i64] [i64 66, i64 108, i64 117, i64 101, i64 115, i64 0], align 16
@genre_CLASSIC_ROCK = internal constant [13 x i64] [i64 67, i64 108, i64 97, i64 115, i64 115, i64 105, i64 99, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_COUNTRY = internal constant [8 x i64] [i64 67, i64 111, i64 117, i64 110, i64 116, i64 114, i64 121, i64 0], align 16
@genre_DANCE = internal constant [6 x i64] [i64 68, i64 97, i64 110, i64 99, i64 101, i64 0], align 16
@genre_DISCO = internal constant [6 x i64] [i64 68, i64 105, i64 115, i64 99, i64 111, i64 0], align 16
@genre_FUNK = internal constant [5 x i64] [i64 70, i64 117, i64 110, i64 107, i64 0], align 16
@genre_GRUNGE = internal constant [7 x i64] [i64 71, i64 114, i64 117, i64 110, i64 103, i64 101, i64 0], align 16
@genre_HIP_HOP = internal constant [8 x i64] [i64 72, i64 105, i64 112, i64 45, i64 72, i64 111, i64 112, i64 0], align 16
@genre_JAZZ = internal constant [5 x i64] [i64 74, i64 97, i64 122, i64 122, i64 0], align 16
@genre_METAL = internal constant [6 x i64] [i64 77, i64 101, i64 116, i64 97, i64 108, i64 0], align 16
@genre_NEW_AGE = internal constant [8 x i64] [i64 78, i64 101, i64 119, i64 32, i64 65, i64 103, i64 101, i64 0], align 16
@genre_OLDIES = internal constant [7 x i64] [i64 79, i64 108, i64 100, i64 105, i64 101, i64 115, i64 0], align 16
@genre_OTHER = internal constant [6 x i64] [i64 79, i64 116, i64 104, i64 101, i64 114, i64 0], align 16
@genre_POP = internal constant [4 x i64] [i64 80, i64 111, i64 112, i64 0], align 16
@genre_R_B = internal constant [4 x i64] [i64 82, i64 38, i64 66, i64 0], align 16
@genre_RAP = internal constant [4 x i64] [i64 82, i64 97, i64 112, i64 0], align 16
@genre_REGGAE = internal constant [7 x i64] [i64 82, i64 101, i64 103, i64 103, i64 97, i64 101, i64 0], align 16
@genre_ROCK = internal constant [5 x i64] [i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_TECHNO = internal constant [7 x i64] [i64 84, i64 101, i64 99, i64 104, i64 110, i64 111, i64 0], align 16
@genre_INDUSTRIAL = internal constant [11 x i64] [i64 73, i64 110, i64 100, i64 117, i64 115, i64 116, i64 114, i64 105, i64 97, i64 108, i64 0], align 16
@genre_ALTERNATIVE = internal constant [12 x i64] [i64 65, i64 108, i64 116, i64 101, i64 114, i64 110, i64 97, i64 116, i64 105, i64 118, i64 101, i64 0], align 16
@genre_SKA = internal constant [4 x i64] [i64 83, i64 107, i64 97, i64 0], align 16
@genre_DEATH_METAL = internal constant [12 x i64] [i64 68, i64 101, i64 97, i64 116, i64 104, i64 32, i64 77, i64 101, i64 116, i64 97, i64 108, i64 0], align 16
@genre_PRANKS = internal constant [7 x i64] [i64 80, i64 114, i64 97, i64 110, i64 107, i64 115, i64 0], align 16
@genre_SOUNDTRACK = internal constant [11 x i64] [i64 83, i64 111, i64 117, i64 110, i64 100, i64 116, i64 114, i64 97, i64 99, i64 107, i64 0], align 16
@genre_EURO_TECHNO = internal constant [12 x i64] [i64 69, i64 117, i64 114, i64 111, i64 45, i64 84, i64 101, i64 99, i64 104, i64 110, i64 111, i64 0], align 16
@genre_AMBIENT = internal constant [8 x i64] [i64 65, i64 109, i64 98, i64 105, i64 101, i64 110, i64 116, i64 0], align 16
@genre_TRIP_HOP = internal constant [9 x i64] [i64 84, i64 114, i64 105, i64 112, i64 45, i64 72, i64 111, i64 112, i64 0], align 16
@genre_VOCAL = internal constant [6 x i64] [i64 86, i64 111, i64 99, i64 97, i64 108, i64 0], align 16
@genre_JAZZ_FUNK = internal constant [10 x i64] [i64 74, i64 97, i64 122, i64 122, i64 43, i64 70, i64 117, i64 110, i64 107, i64 0], align 16
@genre_FUSION = internal constant [7 x i64] [i64 70, i64 117, i64 115, i64 105, i64 111, i64 110, i64 0], align 16
@genre_TRANCE = internal constant [7 x i64] [i64 84, i64 114, i64 97, i64 110, i64 99, i64 101, i64 0], align 16
@genre_CLASSICAL = internal constant [10 x i64] [i64 67, i64 108, i64 97, i64 115, i64 115, i64 105, i64 99, i64 97, i64 108, i64 0], align 16
@genre_INSTRUMENTAL = internal constant [13 x i64] [i64 73, i64 110, i64 115, i64 116, i64 114, i64 117, i64 109, i64 101, i64 110, i64 116, i64 97, i64 108, i64 0], align 16
@genre_ACID = internal constant [5 x i64] [i64 65, i64 99, i64 105, i64 100, i64 0], align 16
@genre_HOUSE = internal constant [6 x i64] [i64 72, i64 111, i64 117, i64 115, i64 101, i64 0], align 16
@genre_GAME = internal constant [5 x i64] [i64 71, i64 97, i64 109, i64 101, i64 0], align 16
@genre_SOUND_CLIP = internal constant [11 x i64] [i64 83, i64 111, i64 117, i64 110, i64 100, i64 32, i64 67, i64 108, i64 105, i64 112, i64 0], align 16
@genre_GOSPEL = internal constant [7 x i64] [i64 71, i64 111, i64 115, i64 112, i64 101, i64 108, i64 0], align 16
@genre_NOISE = internal constant [6 x i64] [i64 78, i64 111, i64 105, i64 115, i64 101, i64 0], align 16
@genre_ALTERNROCK = internal constant [11 x i64] [i64 65, i64 108, i64 116, i64 101, i64 114, i64 110, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_BASS = internal constant [5 x i64] [i64 66, i64 97, i64 115, i64 115, i64 0], align 16
@genre_SOUL = internal constant [5 x i64] [i64 83, i64 111, i64 117, i64 108, i64 0], align 16
@genre_PUNK = internal constant [5 x i64] [i64 80, i64 117, i64 110, i64 107, i64 0], align 16
@genre_SPACE = internal constant [6 x i64] [i64 83, i64 112, i64 97, i64 99, i64 101, i64 0], align 16
@genre_MEDITATIVE = internal constant [11 x i64] [i64 77, i64 101, i64 100, i64 105, i64 116, i64 97, i64 116, i64 105, i64 118, i64 101, i64 0], align 16
@genre_INSTRUMENTAL_POP = internal constant [17 x i64] [i64 73, i64 110, i64 115, i64 116, i64 114, i64 117, i64 109, i64 101, i64 110, i64 116, i64 97, i64 108, i64 32, i64 80, i64 111, i64 112, i64 0], align 16
@genre_INSTRUMENTAL_ROCK = internal constant [18 x i64] [i64 73, i64 110, i64 115, i64 116, i64 114, i64 117, i64 109, i64 101, i64 110, i64 116, i64 97, i64 108, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_ETHNIC = internal constant [7 x i64] [i64 69, i64 116, i64 104, i64 110, i64 105, i64 99, i64 0], align 16
@genre_GOTHIC = internal constant [7 x i64] [i64 71, i64 111, i64 116, i64 104, i64 105, i64 99, i64 0], align 16
@genre_DARKWAVE = internal constant [9 x i64] [i64 68, i64 97, i64 114, i64 107, i64 119, i64 97, i64 118, i64 101, i64 0], align 16
@genre_TECHNO_INDUSTRIAL = internal constant [18 x i64] [i64 84, i64 101, i64 99, i64 104, i64 110, i64 111, i64 45, i64 73, i64 110, i64 100, i64 117, i64 115, i64 116, i64 114, i64 105, i64 97, i64 108, i64 0], align 16
@genre_ELECTRONIC = internal constant [11 x i64] [i64 69, i64 108, i64 101, i64 99, i64 116, i64 114, i64 111, i64 110, i64 105, i64 99, i64 0], align 16
@genre_POP_FOLK = internal constant [9 x i64] [i64 80, i64 111, i64 112, i64 45, i64 70, i64 111, i64 108, i64 107, i64 0], align 16
@genre_EURODANCE = internal constant [10 x i64] [i64 69, i64 117, i64 114, i64 111, i64 100, i64 97, i64 110, i64 99, i64 101, i64 0], align 16
@genre_DREAM = internal constant [6 x i64] [i64 68, i64 114, i64 101, i64 97, i64 109, i64 0], align 16
@genre_SOUTHERN_ROCK = internal constant [14 x i64] [i64 83, i64 111, i64 117, i64 116, i64 104, i64 101, i64 114, i64 110, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_COMEDY = internal constant [7 x i64] [i64 67, i64 111, i64 109, i64 101, i64 100, i64 121, i64 0], align 16
@genre_CULT = internal constant [5 x i64] [i64 67, i64 117, i64 108, i64 116, i64 0], align 16
@genre_GANGSTA = internal constant [8 x i64] [i64 71, i64 97, i64 110, i64 103, i64 115, i64 116, i64 97, i64 0], align 16
@genre_TOP_40 = internal constant [7 x i64] [i64 84, i64 111, i64 112, i64 32, i64 52, i64 48, i64 0], align 16
@genre_CHRISTIAN_RAP = internal constant [14 x i64] [i64 67, i64 104, i64 114, i64 105, i64 115, i64 116, i64 105, i64 97, i64 110, i64 32, i64 82, i64 97, i64 112, i64 0], align 16
@genre_POP_FUNK = internal constant [9 x i64] [i64 80, i64 111, i64 112, i64 47, i64 70, i64 117, i64 110, i64 107, i64 0], align 16
@genre_JUNGLE = internal constant [7 x i64] [i64 74, i64 117, i64 110, i64 103, i64 108, i64 101, i64 0], align 16
@genre_NATIVE_AMERICAN = internal constant [16 x i64] [i64 78, i64 97, i64 116, i64 105, i64 118, i64 101, i64 32, i64 65, i64 109, i64 101, i64 114, i64 105, i64 99, i64 97, i64 110, i64 0], align 16
@genre_CABARET = internal constant [8 x i64] [i64 67, i64 97, i64 98, i64 97, i64 114, i64 101, i64 116, i64 0], align 16
@genre_NEW_WAVE = internal constant [9 x i64] [i64 78, i64 101, i64 119, i64 32, i64 87, i64 97, i64 118, i64 101, i64 0], align 16
@genre_PSYCHEDELIC = internal constant [12 x i64] [i64 80, i64 115, i64 121, i64 99, i64 104, i64 101, i64 100, i64 101, i64 108, i64 105, i64 99, i64 0], align 16
@genre_RAVE = internal constant [5 x i64] [i64 82, i64 97, i64 118, i64 101, i64 0], align 16
@genre_SHOWTUNES = internal constant [10 x i64] [i64 83, i64 104, i64 111, i64 119, i64 116, i64 117, i64 110, i64 101, i64 115, i64 0], align 16
@genre_TRAILER = internal constant [8 x i64] [i64 84, i64 114, i64 97, i64 105, i64 108, i64 101, i64 114, i64 0], align 16
@genre_LO_FI = internal constant [6 x i64] [i64 76, i64 111, i64 45, i64 70, i64 105, i64 0], align 16
@genre_TRIBAL = internal constant [7 x i64] [i64 84, i64 114, i64 105, i64 98, i64 97, i64 108, i64 0], align 16
@genre_ACID_PUNK = internal constant [10 x i64] [i64 65, i64 99, i64 105, i64 100, i64 32, i64 80, i64 117, i64 110, i64 107, i64 0], align 16
@genre_ACID_JAZZ = internal constant [10 x i64] [i64 65, i64 99, i64 105, i64 100, i64 32, i64 74, i64 97, i64 122, i64 122, i64 0], align 16
@genre_POLKA = internal constant [6 x i64] [i64 80, i64 111, i64 108, i64 107, i64 97, i64 0], align 16
@genre_RETRO = internal constant [6 x i64] [i64 82, i64 101, i64 116, i64 114, i64 111, i64 0], align 16
@genre_MUSICAL = internal constant [8 x i64] [i64 77, i64 117, i64 115, i64 105, i64 99, i64 97, i64 108, i64 0], align 16
@genre_ROCK___ROLL = internal constant [12 x i64] [i64 82, i64 111, i64 99, i64 107, i64 32, i64 38, i64 32, i64 82, i64 111, i64 108, i64 108, i64 0], align 16
@genre_HARD_ROCK = internal constant [10 x i64] [i64 72, i64 97, i64 114, i64 100, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_FOLK = internal constant [5 x i64] [i64 70, i64 111, i64 108, i64 107, i64 0], align 16
@genre_FOLK_ROCK = internal constant [10 x i64] [i64 70, i64 111, i64 108, i64 107, i64 47, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_NATIONAL_FOLK = internal constant [14 x i64] [i64 78, i64 97, i64 116, i64 105, i64 111, i64 110, i64 97, i64 108, i64 32, i64 70, i64 111, i64 108, i64 107, i64 0], align 16
@genre_SWING = internal constant [6 x i64] [i64 83, i64 119, i64 105, i64 110, i64 103, i64 0], align 16
@genre_FAST_FUSION = internal constant [12 x i64] [i64 70, i64 97, i64 115, i64 116, i64 45, i64 70, i64 117, i64 115, i64 105, i64 111, i64 110, i64 0], align 16
@genre_BEBOB = internal constant [6 x i64] [i64 66, i64 101, i64 98, i64 111, i64 98, i64 0], align 16
@genre_LATIN = internal constant [6 x i64] [i64 76, i64 97, i64 116, i64 105, i64 110, i64 0], align 16
@genre_REVIVAL = internal constant [8 x i64] [i64 82, i64 101, i64 118, i64 105, i64 118, i64 97, i64 108, i64 0], align 16
@genre_CELTIC = internal constant [7 x i64] [i64 67, i64 101, i64 108, i64 116, i64 105, i64 99, i64 0], align 16
@genre_BLUEGRASS = internal constant [10 x i64] [i64 66, i64 108, i64 117, i64 101, i64 103, i64 114, i64 97, i64 115, i64 115, i64 0], align 16
@genre_AVANTGARDE = internal constant [11 x i64] [i64 65, i64 118, i64 97, i64 110, i64 116, i64 103, i64 97, i64 114, i64 100, i64 101, i64 0], align 16
@genre_GOTHIC_ROCK = internal constant [12 x i64] [i64 71, i64 111, i64 116, i64 104, i64 105, i64 99, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_PROGRESSIVE_ROCK = internal constant [17 x i64] [i64 80, i64 114, i64 111, i64 103, i64 114, i64 101, i64 115, i64 115, i64 105, i64 118, i64 101, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_PSYCHEDELIC_ROCK = internal constant [17 x i64] [i64 80, i64 115, i64 121, i64 99, i64 104, i64 101, i64 100, i64 101, i64 108, i64 105, i64 99, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_SYMPHONIC_ROCK = internal constant [15 x i64] [i64 83, i64 121, i64 109, i64 112, i64 104, i64 111, i64 110, i64 105, i64 99, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_SLOW_ROCK = internal constant [10 x i64] [i64 83, i64 108, i64 111, i64 119, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_BIG_BAND = internal constant [9 x i64] [i64 66, i64 105, i64 103, i64 32, i64 66, i64 97, i64 110, i64 100, i64 0], align 16
@genre_CHORUS = internal constant [7 x i64] [i64 67, i64 104, i64 111, i64 114, i64 117, i64 115, i64 0], align 16
@genre_EASY_LISTENING = internal constant [15 x i64] [i64 69, i64 97, i64 115, i64 121, i64 32, i64 76, i64 105, i64 115, i64 116, i64 101, i64 110, i64 105, i64 110, i64 103, i64 0], align 16
@genre_ACOUSTIC = internal constant [9 x i64] [i64 65, i64 99, i64 111, i64 117, i64 115, i64 116, i64 105, i64 99, i64 0], align 16
@genre_HUMOUR = internal constant [7 x i64] [i64 72, i64 117, i64 109, i64 111, i64 117, i64 114, i64 0], align 16
@genre_SPEECH = internal constant [7 x i64] [i64 83, i64 112, i64 101, i64 101, i64 99, i64 104, i64 0], align 16
@genre_CHANSON = internal constant [8 x i64] [i64 67, i64 104, i64 97, i64 110, i64 115, i64 111, i64 110, i64 0], align 16
@genre_OPERA = internal constant [6 x i64] [i64 79, i64 112, i64 101, i64 114, i64 97, i64 0], align 16
@genre_CHAMBER_MUSIC = internal constant [14 x i64] [i64 67, i64 104, i64 97, i64 109, i64 98, i64 101, i64 114, i64 32, i64 77, i64 117, i64 115, i64 105, i64 99, i64 0], align 16
@genre_SONATA = internal constant [7 x i64] [i64 83, i64 111, i64 110, i64 97, i64 116, i64 97, i64 0], align 16
@genre_SYMPHONY = internal constant [9 x i64] [i64 83, i64 121, i64 109, i64 112, i64 104, i64 111, i64 110, i64 121, i64 0], align 16
@genre_BOOTY_BASS = internal constant [11 x i64] [i64 66, i64 111, i64 111, i64 116, i64 121, i64 32, i64 66, i64 97, i64 115, i64 115, i64 0], align 16
@genre_PRIMUS = internal constant [7 x i64] [i64 80, i64 114, i64 105, i64 109, i64 117, i64 115, i64 0], align 16
@genre_PORN_GROOVE = internal constant [12 x i64] [i64 80, i64 111, i64 114, i64 110, i64 32, i64 71, i64 114, i64 111, i64 111, i64 118, i64 101, i64 0], align 16
@genre_SATIRE = internal constant [7 x i64] [i64 83, i64 97, i64 116, i64 105, i64 114, i64 101, i64 0], align 16
@genre_SLOW_JAM = internal constant [9 x i64] [i64 83, i64 108, i64 111, i64 119, i64 32, i64 74, i64 97, i64 109, i64 0], align 16
@genre_CLUB = internal constant [5 x i64] [i64 67, i64 108, i64 117, i64 98, i64 0], align 16
@genre_TANGO = internal constant [6 x i64] [i64 84, i64 97, i64 110, i64 103, i64 111, i64 0], align 16
@genre_SAMBA = internal constant [6 x i64] [i64 83, i64 97, i64 109, i64 98, i64 97, i64 0], align 16
@genre_FOLKLORE = internal constant [9 x i64] [i64 70, i64 111, i64 108, i64 107, i64 108, i64 111, i64 114, i64 101, i64 0], align 16
@genre_BALLAD = internal constant [7 x i64] [i64 66, i64 97, i64 108, i64 108, i64 97, i64 100, i64 0], align 16
@genre_POWER_BALLAD = internal constant [13 x i64] [i64 80, i64 111, i64 119, i64 101, i64 114, i64 32, i64 66, i64 97, i64 108, i64 108, i64 97, i64 100, i64 0], align 16
@genre_RHYTHMIC_SOUL = internal constant [14 x i64] [i64 82, i64 104, i64 121, i64 116, i64 104, i64 109, i64 105, i64 99, i64 32, i64 83, i64 111, i64 117, i64 108, i64 0], align 16
@genre_FREESTYLE = internal constant [10 x i64] [i64 70, i64 114, i64 101, i64 101, i64 115, i64 116, i64 121, i64 108, i64 101, i64 0], align 16
@genre_DUET = internal constant [5 x i64] [i64 68, i64 117, i64 101, i64 116, i64 0], align 16
@genre_PUNK_ROCK = internal constant [10 x i64] [i64 80, i64 117, i64 110, i64 107, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_DRUM_SOLO = internal constant [10 x i64] [i64 68, i64 114, i64 117, i64 109, i64 32, i64 83, i64 111, i64 108, i64 111, i64 0], align 16
@genre_A_CAPPELLA = internal constant [11 x i64] [i64 65, i64 32, i64 67, i64 97, i64 112, i64 112, i64 101, i64 108, i64 108, i64 97, i64 0], align 16
@genre_EURO_HOUSE = internal constant [11 x i64] [i64 69, i64 117, i64 114, i64 111, i64 45, i64 72, i64 111, i64 117, i64 115, i64 101, i64 0], align 16
@genre_DANCE_HALL = internal constant [11 x i64] [i64 68, i64 97, i64 110, i64 99, i64 101, i64 32, i64 72, i64 97, i64 108, i64 108, i64 0], align 16
@genre_GOA = internal constant [4 x i64] [i64 71, i64 111, i64 97, i64 0], align 16
@genre_DRUM___BASS = internal constant [12 x i64] [i64 68, i64 114, i64 117, i64 109, i64 32, i64 38, i64 32, i64 66, i64 97, i64 115, i64 115, i64 0], align 16
@genre_CLUB_HOUSE = internal constant [11 x i64] [i64 67, i64 108, i64 117, i64 98, i64 45, i64 72, i64 111, i64 117, i64 115, i64 101, i64 0], align 16
@genre_HARDCORE = internal constant [9 x i64] [i64 72, i64 97, i64 114, i64 100, i64 99, i64 111, i64 114, i64 101, i64 0], align 16
@genre_TERROR = internal constant [7 x i64] [i64 84, i64 101, i64 114, i64 114, i64 111, i64 114, i64 0], align 16
@genre_INDIE = internal constant [6 x i64] [i64 73, i64 110, i64 100, i64 105, i64 101, i64 0], align 16
@genre_BRITPOP = internal constant [8 x i64] [i64 66, i64 114, i64 105, i64 116, i64 80, i64 111, i64 112, i64 0], align 16
@genre_NEGERPUNK = internal constant [10 x i64] [i64 78, i64 101, i64 103, i64 101, i64 114, i64 112, i64 117, i64 110, i64 107, i64 0], align 16
@genre_POLSK_PUNK = internal constant [11 x i64] [i64 80, i64 111, i64 108, i64 115, i64 107, i64 32, i64 80, i64 117, i64 110, i64 107, i64 0], align 16
@genre_BEAT = internal constant [5 x i64] [i64 66, i64 101, i64 97, i64 116, i64 0], align 16
@genre_CHRISTIAN_GANGSTA_RAP = internal constant [22 x i64] [i64 67, i64 104, i64 114, i64 105, i64 115, i64 116, i64 105, i64 97, i64 110, i64 32, i64 71, i64 97, i64 110, i64 103, i64 115, i64 116, i64 97, i64 32, i64 82, i64 97, i64 112, i64 0], align 16
@genre_HEAVY_METAL = internal constant [12 x i64] [i64 72, i64 101, i64 97, i64 118, i64 121, i64 32, i64 77, i64 101, i64 116, i64 97, i64 108, i64 0], align 16
@genre_BLACK_METAL = internal constant [12 x i64] [i64 66, i64 108, i64 97, i64 99, i64 107, i64 32, i64 77, i64 101, i64 116, i64 97, i64 108, i64 0], align 16
@genre_CROSSOVER = internal constant [10 x i64] [i64 67, i64 114, i64 111, i64 115, i64 115, i64 111, i64 118, i64 101, i64 114, i64 0], align 16
@genre_CONTEMPORARY_CHRISTIAN = internal constant [23 x i64] [i64 67, i64 111, i64 110, i64 116, i64 101, i64 109, i64 112, i64 111, i64 114, i64 97, i64 114, i64 121, i64 32, i64 67, i64 104, i64 114, i64 105, i64 115, i64 116, i64 105, i64 97, i64 110, i64 0], align 16
@genre_CHRISTIAN_ROCK = internal constant [15 x i64] [i64 67, i64 104, i64 114, i64 105, i64 115, i64 116, i64 105, i64 97, i64 110, i64 32, i64 82, i64 111, i64 99, i64 107, i64 0], align 16
@genre_MERENGUE = internal constant [9 x i64] [i64 77, i64 101, i64 114, i64 101, i64 110, i64 103, i64 117, i64 101, i64 0], align 16
@genre_SALSA = internal constant [6 x i64] [i64 83, i64 97, i64 108, i64 115, i64 97, i64 0], align 16
@genre_THRASH_METAL = internal constant [13 x i64] [i64 84, i64 104, i64 114, i64 97, i64 115, i64 104, i64 32, i64 77, i64 101, i64 116, i64 97, i64 108, i64 0], align 16
@genre_ANIME = internal constant [6 x i64] [i64 65, i64 110, i64 105, i64 109, i64 101, i64 0], align 16
@genre_JPOP = internal constant [5 x i64] [i64 74, i64 80, i64 111, i64 112, i64 0], align 16
@genre_SYNTHPOP = internal constant [9 x i64] [i64 83, i64 121, i64 110, i64 116, i64 104, i64 112, i64 111, i64 112, i64 0], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_genre_name = private constant [14 x i8] c"id3_genre_name"
@__profc_id3_genre_name = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_genre_name = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5709393894303519670, i64 156406123695, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i32 0, i32 0), i8* bitcast (i64* (i64*)* @id3_genre_name to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [24 x i8] c"\0E\16x\DA\CBL1\8EOO\CD+J\8D\CFK\CCM\05\00'\CD\05q", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_genre_name to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i64* @id3_genre_name(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i64, align 8
  store i64* %0, i64** %3, align 8
  %6 = load i64*, i64** %3, align 8
  %7 = icmp eq i64* %6, null
  br i1 %7, label %13, label %8

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 2)
  %10 = load i64*, i64** %3, align 8
  %11 = load i64, i64* %10, align 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 3)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 3)
  store i64* getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), i64** %2, align 8
  br label %90

; <label>:15:                                     ; preds = %8
  %16 = load i64*, i64** %3, align 8
  %17 = getelementptr inbounds i64, i64* %16, i64 0
  %18 = load i64, i64* %17, align 8
  %19 = icmp eq i64 %18, 82
  br i1 %19, label %20, label %34

; <label>:20:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 5)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 5)
  %22 = load i64*, i64** %3, align 8
  %23 = getelementptr inbounds i64, i64* %22, i64 1
  %24 = load i64, i64* %23, align 8
  %25 = icmp eq i64 %24, 88
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 7)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 7)
  %28 = load i64*, i64** %3, align 8
  %29 = getelementptr inbounds i64, i64* %28, i64 2
  %30 = load i64, i64* %29, align 8
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 11)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 11)
  store i64* getelementptr inbounds ([6 x i64], [6 x i64]* @id3_genre_name.genre_remix, i32 0, i32 0), i64** %2, align 8
  br label %90

; <label>:34:                                     ; preds = %26, %20, %15
  %35 = load i64*, i64** %3, align 8
  %36 = getelementptr inbounds i64, i64* %35, i64 0
  %37 = load i64, i64* %36, align 8
  %38 = icmp eq i64 %37, 67
  br i1 %38, label %39, label %53

; <label>:39:                                     ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 6)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 6)
  %41 = load i64*, i64** %3, align 8
  %42 = getelementptr inbounds i64, i64* %41, i64 1
  %43 = load i64, i64* %42, align 8
  %44 = icmp eq i64 %43, 82
  br i1 %44, label %45, label %53

; <label>:45:                                     ; preds = %39
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 8)
  %46 = add i64 %pgocount6, 1
  store i64 %46, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 8)
  %47 = load i64*, i64** %3, align 8
  %48 = getelementptr inbounds i64, i64* %47, i64 2
  %49 = load i64, i64* %48, align 8
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %45
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 12)
  %52 = add i64 %pgocount7, 1
  store i64 %52, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 12)
  store i64* getelementptr inbounds ([6 x i64], [6 x i64]* @id3_genre_name.genre_cover, i32 0, i32 0), i64** %2, align 8
  br label %90

; <label>:53:                                     ; preds = %45, %39, %34
  %54 = load i64*, i64** %3, align 8
  store i64* %54, i64** %4, align 8
  br label %55

; <label>:55:                                     ; preds = %72, %53
  %56 = load i64*, i64** %4, align 8
  %57 = load i64, i64* %56, align 8
  %58 = icmp ne i64 %57, 0
  br i1 %58, label %59, label %76

; <label>:59:                                     ; preds = %55
  %60 = load i64*, i64** %4, align 8
  %61 = load i64, i64* %60, align 8
  %62 = icmp ult i64 %61, 48
  br i1 %62, label %68, label %63

; <label>:63:                                     ; preds = %59
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 0)
  %64 = add i64 %pgocount8, 1
  store i64 %64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 0)
  %65 = load i64*, i64** %4, align 8
  %66 = load i64, i64* %65, align 8
  %67 = icmp ugt i64 %66, 57
  br i1 %67, label %68, label %71

; <label>:68:                                     ; preds = %63, %59
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 4)
  %69 = add i64 %pgocount9, 1
  store i64 %69, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 4)
  %70 = load i64*, i64** %3, align 8
  store i64* %70, i64** %2, align 8
  br label %90

; <label>:71:                                     ; preds = %63
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 1)
  %73 = add i64 %pgocount10, 1
  store i64 %73, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 1)
  %74 = load i64*, i64** %4, align 8
  %75 = getelementptr inbounds i64, i64* %74, i32 1
  store i64* %75, i64** %4, align 8
  br label %55

; <label>:76:                                     ; preds = %55
  %77 = load i64*, i64** %3, align 8
  %78 = call i64 @id3_ucs4_getnumber(i64* %77)
  store i64 %78, i64* %5, align 8
  %79 = load i64, i64* %5, align 8
  %80 = icmp ult i64 %79, 148
  br i1 %80, label %81, label %86

; <label>:81:                                     ; preds = %76
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 9)
  %82 = add i64 %pgocount11, 1
  store i64 %82, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 9)
  %83 = load i64, i64* %5, align 8
  %84 = getelementptr inbounds [148 x i64*], [148 x i64*]* @genre_table, i64 0, i64 %83
  %85 = load i64*, i64** %84, align 8
  br label %88

; <label>:86:                                     ; preds = %76
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 10)
  %87 = add i64 %pgocount12, 1
  store i64 %87, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_id3_genre_name, i64 0, i64 10)
  br label %88

; <label>:88:                                     ; preds = %86, %81
  %89 = phi i64* [ %85, %81 ], [ getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), %86 ]
  store i64* %89, i64** %2, align 8
  br label %90

; <label>:90:                                     ; preds = %88, %68, %51, %32, %13
  %91 = load i64*, i64** %2, align 8
  ret i64* %91
}

declare i64 @id3_ucs4_getnumber(i64*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
