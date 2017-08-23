; ModuleID = 'tmp1.ll'
source_filename = "lookup.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct.flagptr = type { %union.ptr_union, i32 }
%union.ptr_union = type { %struct.flagptr* }
%struct.strchartype = type { i8*, i8*, i8* }

$__llvm_profile_raw_version = comdat any

@inited = internal global i32 0, align 4
@hashname = external global [4096 x i8], align 16
@cbench_print = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [16 x i8] c"Can't open %s\0D\0A\00", align 1
@hashheader = external global %struct.hashheader, align 4
@hashsize = external global i32, align 4
@.str.1 = private unnamed_addr constant [32 x i8] c"Trouble reading hash table %s\0D\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Null hash table %s\0D\0A\00", align 1
@.str.3 = private unnamed_addr constant [54 x i8] c"Truncated hash table %s:  got %d bytes, expected %d\0D\0A\00", align 1
@.str.4 = private unnamed_addr constant [63 x i8] c"Illegal format hash table %s - expected magic 0x%x, got 0x%x\0D\0A\00", align 1
@.str.5 = private unnamed_addr constant [64 x i8] c"Illegal format hash table %s - expected magic2 0x%x, got 0x%x\0D\0A\00", align 1
@.str.6 = private unnamed_addr constant [76 x i8] c"Hash table options don't agree with buildhash - 0x%x/%d/%d vs. 0x%x/%d/%d\0D\0A\00", align 1
@nodictflag = external global i32, align 4
@hashtbl = external global %struct.dent*, align 8
@.str.7 = private unnamed_addr constant [41 x i8] c"Couldn't allocate space for hash table\0D\0A\00", align 1
@hashstrings = external global i8*, align 8
@numsflags = external global i32, align 4
@numpflags = external global i32, align 4
@sflaglist = external global %struct.flagent*, align 8
@pflaglist = external global %struct.flagent*, align 8
@.str.8 = private unnamed_addr constant [28 x i8] c"Illegal format hash table\0D\0A\00", align 1
@sflagindex = external global [228 x %struct.flagptr], align 16
@.str.9 = private unnamed_addr constant [46 x i8] c"Couldn't allocate space for language tables\0D\0A\00", align 1
@pflagindex = external global [228 x %struct.flagptr], align 16
@chartypes = external global %struct.strchartype*, align 8
@.str.10 = private unnamed_addr constant [51 x i8] c"\0D\0AWord '%s' too long at line %d of %s, truncated\0D\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"lookup.c\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_linit = private constant [5 x i8] c"linit"
@__profn_lookup = private constant [6 x i8] c"lookup"
@__profc_linit = private global [67 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_linit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -755901358577762347, i64 952169639538, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i32 0, i32 0), i8* bitcast (i32 ()* @linit to i8*), i8* null, i32 67, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_lookup = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_lookup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1622452139599030851, i64 123972744568, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i32 0, i32 0), i8* bitcast (%struct.dent* (i8*, i32)* @lookup to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [22 x i8] c"\0C\14x\DA\CB\C9\CC\CB,a\CC\C9\CF\CF.-\00\00\1EM\04\BC", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_linit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_lookup to i8*), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @linit() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.flagent*, align 8
  %6 = alloca %struct.flagptr*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = load i32, i32* @inited, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 0)
  store i32 0, i32* %1, align 4
  br label %821

; <label>:14:                                     ; preds = %0
  %15 = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i32 0)
  store i32 %15, i32* %2, align 4
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %26

; <label>:17:                                     ; preds = %14
  %18 = load i32, i32* @cbench_print, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 3)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0))
  br label %24

; <label>:24:                                     ; preds = %20, %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 1)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 1)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:26:                                     ; preds = %14
  %27 = load i32, i32* %2, align 4
  %28 = call i64 @read(i32 %27, i8* bitcast (%struct.hashheader* @hashheader to i8*), i64 3928)
  %29 = trunc i64 %28 to i32
  store i32 %29, i32* @hashsize, align 4
  %30 = load i32, i32* @hashsize, align 4
  %31 = sext i32 %30 to i64
  %32 = icmp ult i64 %31, 3928
  br i1 %32, label %33, label %69

; <label>:33:                                     ; preds = %26
  %34 = load i32, i32* @hashsize, align 4
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %67

; <label>:36:                                     ; preds = %33
  %37 = load i32, i32* @cbench_print, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %43

; <label>:39:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 12)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 12)
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0))
  br label %66

; <label>:43:                                     ; preds = %36
  %44 = load i32, i32* @hashsize, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %64

; <label>:46:                                     ; preds = %43
  %47 = load i32, i32* @cbench_print, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %53

; <label>:49:                                     ; preds = %46
  %pgocount4 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 21)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 21)
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0))
  br label %63

; <label>:53:                                     ; preds = %46
  %pgocount5 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 24)
  %54 = add i64 %pgocount5, 1
  store i64 %54, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 24)
  %55 = load i32, i32* @cbench_print, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %62

; <label>:57:                                     ; preds = %53
  %pgocount6 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 32)
  %58 = add i64 %pgocount6, 1
  store i64 %58, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 32)
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = load i32, i32* @hashsize, align 4
  %61 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i32 %60, i32 3928)
  br label %62

; <label>:62:                                     ; preds = %57, %53
  br label %63

; <label>:63:                                     ; preds = %62, %49
  br label %64

; <label>:64:                                     ; preds = %63, %43
  %pgocount7 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 17)
  %65 = add i64 %pgocount7, 1
  store i64 %65, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 17)
  br label %66

; <label>:66:                                     ; preds = %64, %39
  br label %67

; <label>:67:                                     ; preds = %66, %33
  %pgocount8 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 2)
  %68 = add i64 %pgocount8, 1
  store i64 %68, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 2)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:69:                                     ; preds = %26
  %70 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 0), align 4
  %71 = zext i16 %70 to i32
  %72 = icmp ne i32 %71, 38402
  br i1 %72, label %73, label %84

; <label>:73:                                     ; preds = %69
  %74 = load i32, i32* @cbench_print, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %82

; <label>:76:                                     ; preds = %73
  %pgocount9 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 8)
  %77 = add i64 %pgocount9, 1
  store i64 %77, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 8)
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %79 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 0), align 4
  %80 = zext i16 %79 to i32
  %81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %78, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i32 38402, i32 %80)
  br label %82

; <label>:82:                                     ; preds = %76, %73
  %pgocount10 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 4)
  %83 = add i64 %pgocount10, 1
  store i64 %83, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 4)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:84:                                     ; preds = %69
  %85 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 31), align 4
  %86 = zext i16 %85 to i32
  %87 = icmp ne i32 %86, 38402
  br i1 %87, label %88, label %99

; <label>:88:                                     ; preds = %84
  %89 = load i32, i32* @cbench_print, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %97

; <label>:91:                                     ; preds = %88
  %pgocount11 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 16)
  %92 = add i64 %pgocount11, 1
  store i64 %92, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 16)
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %94 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 31), align 4
  %95 = zext i16 %94 to i32
  %96 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @hashname, i32 0, i32 0), i32 38402, i32 %95)
  br label %97

; <label>:97:                                     ; preds = %91, %88
  %pgocount12 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 9)
  %98 = add i64 %pgocount12, 1
  store i64 %98, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 9)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:99:                                     ; preds = %84
  %100 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 1), align 2
  %101 = zext i16 %100 to i32
  %102 = icmp ne i32 %101, 3
  br i1 %102, label %113, label %103

; <label>:103:                                    ; preds = %99
  %pgocount13 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 19)
  %104 = add i64 %pgocount13, 1
  store i64 %104, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 19)
  %105 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 2), align 4
  %106 = sext i16 %105 to i32
  %107 = icmp ne i32 %106, 100
  br i1 %107, label %113, label %108

; <label>:108:                                    ; preds = %103
  %pgocount14 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 20)
  %109 = add i64 %pgocount14, 1
  store i64 %109, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 20)
  %110 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 3), align 2
  %111 = sext i16 %110 to i32
  %112 = icmp ne i32 %111, 10
  br i1 %112, label %113, label %128

; <label>:113:                                    ; preds = %108, %103, %99
  %114 = load i32, i32* @cbench_print, align 4
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %126

; <label>:116:                                    ; preds = %113
  %pgocount15 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 18)
  %117 = add i64 %pgocount15, 1
  store i64 %117, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 18)
  %118 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %119 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 1), align 2
  %120 = zext i16 %119 to i32
  %121 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 2), align 4
  %122 = sext i16 %121 to i32
  %123 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 3), align 2
  %124 = sext i16 %123 to i32
  %125 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %118, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.6, i32 0, i32 0), i32 %120, i32 %122, i32 %124, i32 3, i32 100, i32 10)
  br label %126

; <label>:126:                                    ; preds = %116, %113
  %pgocount16 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 14)
  %127 = add i64 %pgocount16, 1
  store i64 %127, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 14)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:128:                                    ; preds = %108
  br label %129

; <label>:129:                                    ; preds = %128
  br label %130

; <label>:130:                                    ; preds = %129
  br label %131

; <label>:131:                                    ; preds = %130
  %132 = load i32, i32* @nodictflag, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %165

; <label>:134:                                    ; preds = %131
  store i32 1, i32* @hashsize, align 4
  %135 = call noalias i8* @calloc(i64 1, i64 24) #4
  %136 = bitcast i8* %135 to %struct.dent*
  store %struct.dent* %136, %struct.dent** @hashtbl, align 8
  %137 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %138 = icmp eq %struct.dent* %137, null
  br i1 %138, label %139, label %148

; <label>:139:                                    ; preds = %134
  %140 = load i32, i32* @cbench_print, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %146

; <label>:142:                                    ; preds = %139
  %pgocount17 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 47)
  %143 = add i64 %pgocount17, 1
  store i64 %143, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 47)
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %144, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0))
  br label %146

; <label>:146:                                    ; preds = %142, %139
  %pgocount18 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 42)
  %147 = add i64 %pgocount18, 1
  store i64 %147, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 42)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:148:                                    ; preds = %134
  %pgocount19 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 33)
  %149 = add i64 %pgocount19, 1
  store i64 %149, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 33)
  %150 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %151 = getelementptr inbounds %struct.dent, %struct.dent* %150, i64 0
  %152 = getelementptr inbounds %struct.dent, %struct.dent* %151, i32 0, i32 1
  store i8* null, i8** %152, align 8
  %153 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %154 = getelementptr inbounds %struct.dent, %struct.dent* %153, i64 0
  %155 = getelementptr inbounds %struct.dent, %struct.dent* %154, i32 0, i32 0
  store %struct.dent* null, %struct.dent** %155, align 8
  %156 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %157 = getelementptr inbounds %struct.dent, %struct.dent* %156, i64 0
  %158 = getelementptr inbounds %struct.dent, %struct.dent* %157, i32 0, i32 2
  %159 = getelementptr inbounds [1 x i64], [1 x i64]* %158, i64 0, i64 0
  %160 = load i64, i64* %159, align 8
  %161 = and i64 %160, -201326593
  store i64 %161, i64* %159, align 8
  %162 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 7), align 4
  %163 = zext i32 %162 to i64
  %164 = call noalias i8* @malloc(i64 %163) #4
  store i8* %164, i8** @hashstrings, align 8
  br label %176

; <label>:165:                                    ; preds = %131
  %pgocount20 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 34)
  %166 = add i64 %pgocount20, 1
  store i64 %166, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 34)
  %167 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 8), align 4
  %168 = zext i32 %167 to i64
  %169 = mul i64 %168, 24
  %170 = call noalias i8* @malloc(i64 %169) #4
  %171 = bitcast i8* %170 to %struct.dent*
  store %struct.dent* %171, %struct.dent** @hashtbl, align 8
  %172 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 8), align 4
  store i32 %172, i32* @hashsize, align 4
  %173 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 6), align 4
  %174 = zext i32 %173 to i64
  %175 = call noalias i8* @malloc(i64 %174) #4
  store i8* %175, i8** @hashstrings, align 8
  br label %176

; <label>:176:                                    ; preds = %165, %148
  %177 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 9), align 4
  store i32 %177, i32* @numsflags, align 4
  %178 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 10), align 4
  store i32 %178, i32* @numpflags, align 4
  %179 = load i32, i32* @numsflags, align 4
  %180 = load i32, i32* @numpflags, align 4
  %181 = add nsw i32 %179, %180
  %182 = sext i32 %181 to i64
  %183 = mul i64 %182, 256
  %184 = call noalias i8* @malloc(i64 %183) #4
  %185 = bitcast i8* %184 to %struct.flagent*
  store %struct.flagent* %185, %struct.flagent** @sflaglist, align 8
  %186 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %187 = icmp eq %struct.dent* %186, null
  br i1 %187, label %196, label %188

; <label>:188:                                    ; preds = %176
  %pgocount21 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 26)
  %189 = add i64 %pgocount21, 1
  store i64 %189, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 26)
  %190 = load i8*, i8** @hashstrings, align 8
  %191 = icmp eq i8* %190, null
  br i1 %191, label %196, label %192

; <label>:192:                                    ; preds = %188
  %pgocount22 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 40)
  %193 = add i64 %pgocount22, 1
  store i64 %193, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 40)
  %194 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  %195 = icmp eq %struct.flagent* %194, null
  br i1 %195, label %196, label %204

; <label>:196:                                    ; preds = %192, %188, %176
  %197 = load i32, i32* @cbench_print, align 4
  %198 = icmp ne i32 %197, 0
  br i1 %198, label %199, label %203

; <label>:199:                                    ; preds = %196
  %pgocount23 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 36)
  %200 = add i64 %pgocount23, 1
  store i64 %200, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 36)
  %201 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %202 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %201, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0))
  br label %203

; <label>:203:                                    ; preds = %199, %196
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:204:                                    ; preds = %192
  %205 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  %206 = load i32, i32* @numsflags, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds %struct.flagent, %struct.flagent* %205, i64 %207
  store %struct.flagent* %208, %struct.flagent** @pflaglist, align 8
  %209 = load i32, i32* @nodictflag, align 4
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %241

; <label>:211:                                    ; preds = %204
  %212 = load i32, i32* %2, align 4
  %213 = load i8*, i8** @hashstrings, align 8
  %214 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 7), align 4
  %215 = zext i32 %214 to i64
  %216 = call i64 @read(i32 %212, i8* %213, i64 %215)
  %217 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 7), align 4
  %218 = sext i32 %217 to i64
  %219 = icmp ne i64 %216, %218
  br i1 %219, label %220, label %229

; <label>:220:                                    ; preds = %211
  %221 = load i32, i32* @cbench_print, align 4
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %227

; <label>:223:                                    ; preds = %220
  %pgocount24 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 53)
  %224 = add i64 %pgocount24, 1
  store i64 %224, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 53)
  %225 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %226 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %225, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.8, i32 0, i32 0))
  br label %227

; <label>:227:                                    ; preds = %223, %220
  %pgocount25 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 50)
  %228 = add i64 %pgocount25, 1
  store i64 %228, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 50)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:229:                                    ; preds = %211
  %230 = load i32, i32* %2, align 4
  %231 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 6), align 4
  %232 = sext i32 %231 to i64
  %233 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 7), align 4
  %234 = sext i32 %233 to i64
  %235 = sub nsw i64 %232, %234
  %236 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 8), align 4
  %237 = sext i32 %236 to i64
  %238 = mul nsw i64 %237, 24
  %239 = add nsw i64 %235, %238
  %240 = call i64 @lseek(i32 %230, i64 %239, i32 1) #4
  br label %274

; <label>:241:                                    ; preds = %204
  %242 = load i32, i32* %2, align 4
  %243 = load i8*, i8** @hashstrings, align 8
  %244 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 6), align 4
  %245 = zext i32 %244 to i64
  %246 = call i64 @read(i32 %242, i8* %243, i64 %245)
  %247 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 6), align 4
  %248 = sext i32 %247 to i64
  %249 = icmp ne i64 %246, %248
  br i1 %249, label %263, label %250

; <label>:250:                                    ; preds = %241
  %pgocount26 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 54)
  %251 = add i64 %pgocount26, 1
  store i64 %251, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 54)
  %252 = load i32, i32* %2, align 4
  %253 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %254 = bitcast %struct.dent* %253 to i8*
  %255 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 8), align 4
  %256 = zext i32 %255 to i64
  %257 = mul i64 %256, 24
  %258 = call i64 @read(i32 %252, i8* %254, i64 %257)
  %259 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 8), align 4
  %260 = sext i32 %259 to i64
  %261 = mul i64 %260, 24
  %262 = icmp ne i64 %258, %261
  br i1 %262, label %263, label %272

; <label>:263:                                    ; preds = %250, %241
  %264 = load i32, i32* @cbench_print, align 4
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %266, label %270

; <label>:266:                                    ; preds = %263
  %pgocount27 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 55)
  %267 = add i64 %pgocount27, 1
  store i64 %267, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 55)
  %268 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %269 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %268, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.8, i32 0, i32 0))
  br label %270

; <label>:270:                                    ; preds = %266, %263
  %pgocount28 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 51)
  %271 = add i64 %pgocount28, 1
  store i64 %271, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 51)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:272:                                    ; preds = %250
  %pgocount29 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 57)
  %273 = add i64 %pgocount29, 1
  store i64 %273, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 57)
  br label %274

; <label>:274:                                    ; preds = %272, %229
  %275 = load i32, i32* %2, align 4
  %276 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  %277 = bitcast %struct.flagent* %276 to i8*
  %278 = load i32, i32* @numsflags, align 4
  %279 = load i32, i32* @numpflags, align 4
  %280 = add nsw i32 %278, %279
  %281 = zext i32 %280 to i64
  %282 = mul i64 %281, 256
  %283 = call i64 @read(i32 %275, i8* %277, i64 %282)
  %284 = load i32, i32* @numsflags, align 4
  %285 = load i32, i32* @numpflags, align 4
  %286 = add nsw i32 %284, %285
  %287 = sext i32 %286 to i64
  %288 = mul i64 %287, 256
  %289 = icmp ne i64 %283, %288
  br i1 %289, label %290, label %299

; <label>:290:                                    ; preds = %274
  %291 = load i32, i32* @cbench_print, align 4
  %292 = icmp ne i32 %291, 0
  br i1 %292, label %293, label %297

; <label>:293:                                    ; preds = %290
  %pgocount30 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 56)
  %294 = add i64 %pgocount30, 1
  store i64 %294, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 56)
  %295 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %296 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %295, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.8, i32 0, i32 0))
  br label %297

; <label>:297:                                    ; preds = %293, %290
  %pgocount31 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 52)
  %298 = add i64 %pgocount31, 1
  store i64 %298, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 52)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:299:                                    ; preds = %274
  %300 = load i32, i32* %2, align 4
  %301 = call i32 @close(i32 %300)
  %302 = load i32, i32* @nodictflag, align 4
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %356, label %304

; <label>:304:                                    ; preds = %299
  %305 = load i32, i32* @hashsize, align 4
  store i32 %305, i32* %3, align 4
  %306 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  store %struct.dent* %306, %struct.dent** %4, align 8
  br label %307

; <label>:307:                                    ; preds = %351, %304
  %308 = load i32, i32* %3, align 4
  %309 = add nsw i32 %308, -1
  store i32 %309, i32* %3, align 4
  %310 = icmp sge i32 %309, 0
  br i1 %310, label %311, label %354

; <label>:311:                                    ; preds = %307
  %312 = load %struct.dent*, %struct.dent** %4, align 8
  %313 = getelementptr inbounds %struct.dent, %struct.dent* %312, i32 0, i32 1
  %314 = load i8*, i8** %313, align 8
  %315 = icmp eq i8* %314, inttoptr (i64 -1 to i8*)
  br i1 %315, label %316, label %320

; <label>:316:                                    ; preds = %311
  %pgocount32 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 45)
  %317 = add i64 %pgocount32, 1
  store i64 %317, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 45)
  %318 = load %struct.dent*, %struct.dent** %4, align 8
  %319 = getelementptr inbounds %struct.dent, %struct.dent* %318, i32 0, i32 1
  store i8* null, i8** %319, align 8
  br label %330

; <label>:320:                                    ; preds = %311
  %321 = load i8*, i8** @hashstrings, align 8
  %322 = load %struct.dent*, %struct.dent** %4, align 8
  %323 = getelementptr inbounds %struct.dent, %struct.dent* %322, i32 0, i32 1
  %324 = load i8*, i8** %323, align 8
  %325 = ptrtoint i8* %324 to i32
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i8, i8* %321, i64 %326
  %328 = load %struct.dent*, %struct.dent** %4, align 8
  %329 = getelementptr inbounds %struct.dent, %struct.dent* %328, i32 0, i32 1
  store i8* %327, i8** %329, align 8
  br label %330

; <label>:330:                                    ; preds = %320, %316
  %331 = load %struct.dent*, %struct.dent** %4, align 8
  %332 = getelementptr inbounds %struct.dent, %struct.dent* %331, i32 0, i32 0
  %333 = load %struct.dent*, %struct.dent** %332, align 8
  %334 = icmp eq %struct.dent* %333, inttoptr (i64 -1 to %struct.dent*)
  br i1 %334, label %335, label %339

; <label>:335:                                    ; preds = %330
  %pgocount33 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 46)
  %336 = add i64 %pgocount33, 1
  store i64 %336, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 46)
  %337 = load %struct.dent*, %struct.dent** %4, align 8
  %338 = getelementptr inbounds %struct.dent, %struct.dent* %337, i32 0, i32 0
  store %struct.dent* null, %struct.dent** %338, align 8
  br label %350

; <label>:339:                                    ; preds = %330
  %pgocount34 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 41)
  %340 = add i64 %pgocount34, 1
  store i64 %340, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 41)
  %341 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %342 = load %struct.dent*, %struct.dent** %4, align 8
  %343 = getelementptr inbounds %struct.dent, %struct.dent* %342, i32 0, i32 0
  %344 = load %struct.dent*, %struct.dent** %343, align 8
  %345 = ptrtoint %struct.dent* %344 to i32
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds %struct.dent, %struct.dent* %341, i64 %346
  %348 = load %struct.dent*, %struct.dent** %4, align 8
  %349 = getelementptr inbounds %struct.dent, %struct.dent* %348, i32 0, i32 0
  store %struct.dent* %347, %struct.dent** %349, align 8
  br label %350

; <label>:350:                                    ; preds = %339, %335
  br label %351

; <label>:351:                                    ; preds = %350
  %352 = load %struct.dent*, %struct.dent** %4, align 8
  %353 = getelementptr inbounds %struct.dent, %struct.dent* %352, i32 1
  store %struct.dent* %353, %struct.dent** %4, align 8
  br label %307

; <label>:354:                                    ; preds = %307
  %pgocount35 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 58)
  %355 = add i64 %pgocount35, 1
  store i64 %355, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 58)
  br label %356

; <label>:356:                                    ; preds = %354, %299
  %357 = load i32, i32* @numsflags, align 4
  %358 = load i32, i32* @numpflags, align 4
  %359 = add nsw i32 %357, %358
  store i32 %359, i32* %3, align 4
  %360 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  store %struct.flagent* %360, %struct.flagent** %5, align 8
  br label %361

; <label>:361:                                    ; preds = %405, %356
  %362 = load i32, i32* %3, align 4
  %363 = add nsw i32 %362, -1
  store i32 %363, i32* %3, align 4
  %364 = icmp sge i32 %363, 0
  br i1 %364, label %365, label %408

; <label>:365:                                    ; preds = %361
  %366 = load %struct.flagent*, %struct.flagent** %5, align 8
  %367 = getelementptr inbounds %struct.flagent, %struct.flagent* %366, i32 0, i32 3
  %368 = load i16, i16* %367, align 2
  %369 = icmp ne i16 %368, 0
  br i1 %369, label %370, label %380

; <label>:370:                                    ; preds = %365
  %371 = load i8*, i8** @hashstrings, align 8
  %372 = load %struct.flagent*, %struct.flagent** %5, align 8
  %373 = getelementptr inbounds %struct.flagent, %struct.flagent* %372, i32 0, i32 0
  %374 = load i8*, i8** %373, align 8
  %375 = ptrtoint i8* %374 to i32
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i8, i8* %371, i64 %376
  %378 = load %struct.flagent*, %struct.flagent** %5, align 8
  %379 = getelementptr inbounds %struct.flagent, %struct.flagent* %378, i32 0, i32 0
  store i8* %377, i8** %379, align 8
  br label %384

; <label>:380:                                    ; preds = %365
  %pgocount36 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 27)
  %381 = add i64 %pgocount36, 1
  store i64 %381, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 27)
  %382 = load %struct.flagent*, %struct.flagent** %5, align 8
  %383 = getelementptr inbounds %struct.flagent, %struct.flagent* %382, i32 0, i32 0
  store i8* null, i8** %383, align 8
  br label %384

; <label>:384:                                    ; preds = %380, %370
  %385 = load %struct.flagent*, %struct.flagent** %5, align 8
  %386 = getelementptr inbounds %struct.flagent, %struct.flagent* %385, i32 0, i32 4
  %387 = load i16, i16* %386, align 4
  %388 = icmp ne i16 %387, 0
  br i1 %388, label %389, label %400

; <label>:389:                                    ; preds = %384
  %pgocount37 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 22)
  %390 = add i64 %pgocount37, 1
  store i64 %390, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 22)
  %391 = load i8*, i8** @hashstrings, align 8
  %392 = load %struct.flagent*, %struct.flagent** %5, align 8
  %393 = getelementptr inbounds %struct.flagent, %struct.flagent* %392, i32 0, i32 1
  %394 = load i8*, i8** %393, align 8
  %395 = ptrtoint i8* %394 to i32
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds i8, i8* %391, i64 %396
  %398 = load %struct.flagent*, %struct.flagent** %5, align 8
  %399 = getelementptr inbounds %struct.flagent, %struct.flagent* %398, i32 0, i32 1
  store i8* %397, i8** %399, align 8
  br label %404

; <label>:400:                                    ; preds = %384
  %pgocount38 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 28)
  %401 = add i64 %pgocount38, 1
  store i64 %401, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 28)
  %402 = load %struct.flagent*, %struct.flagent** %5, align 8
  %403 = getelementptr inbounds %struct.flagent, %struct.flagent* %402, i32 0, i32 1
  store i8* null, i8** %403, align 8
  br label %404

; <label>:404:                                    ; preds = %400, %389
  br label %405

; <label>:405:                                    ; preds = %404
  %406 = load %struct.flagent*, %struct.flagent** %5, align 8
  %407 = getelementptr inbounds %struct.flagent, %struct.flagent* %406, i32 1
  store %struct.flagent* %407, %struct.flagent** %5, align 8
  br label %361

; <label>:408:                                    ; preds = %361
  %409 = load i32, i32* @numsflags, align 4
  store i32 %409, i32* %3, align 4
  %410 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  store %struct.flagent* %410, %struct.flagent** %5, align 8
  br label %411

; <label>:411:                                    ; preds = %558, %408
  %412 = load i32, i32* %3, align 4
  %413 = icmp sgt i32 %412, 0
  br i1 %413, label %414, label %563

; <label>:414:                                    ; preds = %411
  %415 = load %struct.flagent*, %struct.flagent** %5, align 8
  %416 = getelementptr inbounds %struct.flagent, %struct.flagent* %415, i32 0, i32 4
  %417 = load i16, i16* %416, align 4
  %418 = sext i16 %417 to i32
  %419 = icmp eq i32 %418, 0
  br i1 %419, label %420, label %422

; <label>:420:                                    ; preds = %414
  %pgocount39 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 29)
  %421 = add i64 %pgocount39, 1
  store i64 %421, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 29)
  store i8* null, i8** %9, align 8
  store %struct.flagptr* getelementptr inbounds ([228 x %struct.flagptr], [228 x %struct.flagptr]* @sflagindex, i64 0, i64 0), %struct.flagptr** %6, align 8
  store i32 1, i32* %8, align 4
  br label %478

; <label>:422:                                    ; preds = %414
  %423 = load %struct.flagent*, %struct.flagent** %5, align 8
  %424 = getelementptr inbounds %struct.flagent, %struct.flagent* %423, i32 0, i32 1
  %425 = load i8*, i8** %424, align 8
  %426 = load %struct.flagent*, %struct.flagent** %5, align 8
  %427 = getelementptr inbounds %struct.flagent, %struct.flagent* %426, i32 0, i32 4
  %428 = load i16, i16* %427, align 4
  %429 = sext i16 %428 to i32
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i8, i8* %425, i64 %430
  %432 = getelementptr inbounds i8, i8* %431, i64 -1
  store i8* %432, i8** %9, align 8
  %433 = load i8*, i8** %9, align 8
  %434 = load i8, i8* %433, align 1
  %435 = zext i8 %434 to i64
  %436 = getelementptr inbounds [228 x %struct.flagptr], [228 x %struct.flagptr]* @sflagindex, i64 0, i64 %435
  store %struct.flagptr* %436, %struct.flagptr** %6, align 8
  store i32 0, i32* %8, align 4
  br label %437

; <label>:437:                                    ; preds = %475, %422
  %438 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %439 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %438, i32 0, i32 1
  %440 = load i32, i32* %439, align 8
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %442, label %449

; <label>:442:                                    ; preds = %437
  %pgocount40 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 10)
  %443 = add i64 %pgocount40, 1
  store i64 %443, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 10)
  %444 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %445 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %444, i32 0, i32 0
  %446 = bitcast %union.ptr_union* %445 to %struct.flagptr**
  %447 = load %struct.flagptr*, %struct.flagptr** %446, align 8
  %448 = icmp ne %struct.flagptr* %447, null
  br label %449

; <label>:449:                                    ; preds = %442, %437
  %450 = phi i1 [ false, %437 ], [ %448, %442 ]
  br i1 %450, label %451, label %476

; <label>:451:                                    ; preds = %449
  %452 = load i8*, i8** %9, align 8
  %453 = load %struct.flagent*, %struct.flagent** %5, align 8
  %454 = getelementptr inbounds %struct.flagent, %struct.flagent* %453, i32 0, i32 1
  %455 = load i8*, i8** %454, align 8
  %456 = icmp eq i8* %452, %455
  br i1 %456, label %457, label %464

; <label>:457:                                    ; preds = %451
  %pgocount41 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 11)
  %458 = add i64 %pgocount41, 1
  store i64 %458, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 11)
  %459 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %460 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %459, i32 0, i32 0
  %461 = bitcast %union.ptr_union* %460 to %struct.flagptr**
  %462 = load %struct.flagptr*, %struct.flagptr** %461, align 8
  %463 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %462, i64 0
  store %struct.flagptr* %463, %struct.flagptr** %6, align 8
  store i32 1, i32* %8, align 4
  br label %475

; <label>:464:                                    ; preds = %451
  %pgocount42 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 5)
  %465 = add i64 %pgocount42, 1
  store i64 %465, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 5)
  %466 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %467 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %466, i32 0, i32 0
  %468 = bitcast %union.ptr_union* %467 to %struct.flagptr**
  %469 = load %struct.flagptr*, %struct.flagptr** %468, align 8
  %470 = load i8*, i8** %9, align 8
  %471 = getelementptr inbounds i8, i8* %470, i32 -1
  store i8* %471, i8** %9, align 8
  %472 = load i8, i8* %471, align 1
  %473 = zext i8 %472 to i64
  %474 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %469, i64 %473
  store %struct.flagptr* %474, %struct.flagptr** %6, align 8
  store i32 0, i32* %8, align 4
  br label %475

; <label>:475:                                    ; preds = %464, %457
  br label %437

; <label>:476:                                    ; preds = %449
  %pgocount43 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 23)
  %477 = add i64 %pgocount43, 1
  store i64 %477, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 23)
  br label %478

; <label>:478:                                    ; preds = %476, %420
  %479 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %480 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %479, i32 0, i32 1
  %481 = load i32, i32* %480, align 8
  %482 = icmp eq i32 %481, 0
  br i1 %482, label %483, label %489

; <label>:483:                                    ; preds = %478
  %pgocount44 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 30)
  %484 = add i64 %pgocount44, 1
  store i64 %484, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 30)
  %485 = load %struct.flagent*, %struct.flagent** %5, align 8
  %486 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %487 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %486, i32 0, i32 0
  %488 = bitcast %union.ptr_union* %487 to %struct.flagent**
  store %struct.flagent* %485, %struct.flagent** %488, align 8
  br label %489

; <label>:489:                                    ; preds = %483, %478
  %490 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %491 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %490, i32 0, i32 1
  %492 = load i32, i32* %491, align 8
  %493 = add nsw i32 %492, 1
  store i32 %493, i32* %491, align 8
  %494 = load i32, i32* %8, align 4
  %495 = icmp ne i32 %494, 0
  br i1 %495, label %557, label %496

; <label>:496:                                    ; preds = %489
  %pgocount45 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 31)
  %497 = add i64 %pgocount45, 1
  store i64 %497, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 31)
  %498 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %499 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %498, i32 0, i32 1
  %500 = load i32, i32* %499, align 8
  %501 = icmp sge i32 %500, 4
  br i1 %501, label %502, label %557

; <label>:502:                                    ; preds = %496
  %pgocount46 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 43)
  %503 = add i64 %pgocount46, 1
  store i64 %503, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 43)
  %504 = load %struct.flagent*, %struct.flagent** %5, align 8
  %505 = getelementptr inbounds %struct.flagent, %struct.flagent* %504, i32 0, i32 1
  %506 = load i8*, i8** %505, align 8
  %507 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %508 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %507, i32 0, i32 0
  %509 = bitcast %union.ptr_union* %508 to %struct.flagent**
  %510 = load %struct.flagent*, %struct.flagent** %509, align 8
  %511 = getelementptr inbounds %struct.flagent, %struct.flagent* %510, i32 0, i32 1
  %512 = load i8*, i8** %511, align 8
  %513 = call i32 @strcmp(i8* %506, i8* %512) #5
  %514 = icmp ne i32 %513, 0
  br i1 %514, label %515, label %557

; <label>:515:                                    ; preds = %502
  %516 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %517 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %516, i32 0, i32 0
  %518 = bitcast %union.ptr_union* %517 to %struct.flagent**
  %519 = load %struct.flagent*, %struct.flagent** %518, align 8
  %520 = getelementptr inbounds %struct.flagent, %struct.flagent* %519, i64 -1
  store %struct.flagent* %520, %struct.flagent** %5, align 8
  %521 = load i32, i32* @numsflags, align 4
  %522 = sext i32 %521 to i64
  %523 = load %struct.flagent*, %struct.flagent** %5, align 8
  %524 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  %525 = ptrtoint %struct.flagent* %523 to i64
  %526 = ptrtoint %struct.flagent* %524 to i64
  %527 = sub i64 %525, %526
  %528 = sdiv exact i64 %527, 256
  %529 = sub nsw i64 %522, %528
  %530 = trunc i64 %529 to i32
  store i32 %530, i32* %3, align 4
  %531 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  %532 = add nsw i32 128, %531
  %533 = zext i32 %532 to i64
  %534 = call noalias i8* @calloc(i64 %533, i64 16) #4
  %535 = bitcast i8* %534 to %struct.flagptr*
  %536 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %537 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %536, i32 0, i32 0
  %538 = bitcast %union.ptr_union* %537 to %struct.flagptr**
  store %struct.flagptr* %535, %struct.flagptr** %538, align 8
  %539 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %540 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %539, i32 0, i32 0
  %541 = bitcast %union.ptr_union* %540 to %struct.flagptr**
  %542 = load %struct.flagptr*, %struct.flagptr** %541, align 8
  %543 = icmp eq %struct.flagptr* %542, null
  br i1 %543, label %544, label %553

; <label>:544:                                    ; preds = %515
  %545 = load i32, i32* @cbench_print, align 4
  %546 = icmp ne i32 %545, 0
  br i1 %546, label %547, label %551

; <label>:547:                                    ; preds = %544
  %pgocount47 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 65)
  %548 = add i64 %pgocount47, 1
  store i64 %548, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 65)
  %549 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %550 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %549, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i32 0, i32 0))
  br label %551

; <label>:551:                                    ; preds = %547, %544
  %pgocount48 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 63)
  %552 = add i64 %pgocount48, 1
  store i64 %552, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 63)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:553:                                    ; preds = %515
  %pgocount49 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 48)
  %554 = add i64 %pgocount49, 1
  store i64 %554, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 48)
  %555 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %556 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %555, i32 0, i32 1
  store i32 0, i32* %556, align 8
  br label %557

; <label>:557:                                    ; preds = %553, %502, %496, %489
  br label %558

; <label>:558:                                    ; preds = %557
  %559 = load i32, i32* %3, align 4
  %560 = add nsw i32 %559, -1
  store i32 %560, i32* %3, align 4
  %561 = load %struct.flagent*, %struct.flagent** %5, align 8
  %562 = getelementptr inbounds %struct.flagent, %struct.flagent* %561, i32 1
  store %struct.flagent* %562, %struct.flagent** %5, align 8
  br label %411

; <label>:563:                                    ; preds = %411
  %564 = load i32, i32* @numpflags, align 4
  store i32 %564, i32* %3, align 4
  %565 = load %struct.flagent*, %struct.flagent** @pflaglist, align 8
  store %struct.flagent* %565, %struct.flagent** %5, align 8
  br label %566

; <label>:566:                                    ; preds = %706, %563
  %567 = load i32, i32* %3, align 4
  %568 = icmp sgt i32 %567, 0
  br i1 %568, label %569, label %711

; <label>:569:                                    ; preds = %566
  %570 = load %struct.flagent*, %struct.flagent** %5, align 8
  %571 = getelementptr inbounds %struct.flagent, %struct.flagent* %570, i32 0, i32 4
  %572 = load i16, i16* %571, align 4
  %573 = sext i16 %572 to i32
  %574 = icmp eq i32 %573, 0
  br i1 %574, label %575, label %577

; <label>:575:                                    ; preds = %569
  %pgocount50 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 37)
  %576 = add i64 %pgocount50, 1
  store i64 %576, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 37)
  store i8* null, i8** %9, align 8
  store %struct.flagptr* getelementptr inbounds ([228 x %struct.flagptr], [228 x %struct.flagptr]* @pflagindex, i64 0, i64 0), %struct.flagptr** %6, align 8
  store i32 1, i32* %8, align 4
  br label %626

; <label>:577:                                    ; preds = %569
  %578 = load %struct.flagent*, %struct.flagent** %5, align 8
  %579 = getelementptr inbounds %struct.flagent, %struct.flagent* %578, i32 0, i32 1
  %580 = load i8*, i8** %579, align 8
  store i8* %580, i8** %9, align 8
  %581 = load i8*, i8** %9, align 8
  %582 = getelementptr inbounds i8, i8* %581, i32 1
  store i8* %582, i8** %9, align 8
  %583 = load i8, i8* %581, align 1
  %584 = zext i8 %583 to i64
  %585 = getelementptr inbounds [228 x %struct.flagptr], [228 x %struct.flagptr]* @pflagindex, i64 0, i64 %584
  store %struct.flagptr* %585, %struct.flagptr** %6, align 8
  store i32 0, i32* %8, align 4
  br label %586

; <label>:586:                                    ; preds = %623, %577
  %587 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %588 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %587, i32 0, i32 1
  %589 = load i32, i32* %588, align 8
  %590 = icmp eq i32 %589, 0
  br i1 %590, label %591, label %598

; <label>:591:                                    ; preds = %586
  %pgocount51 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 13)
  %592 = add i64 %pgocount51, 1
  store i64 %592, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 13)
  %593 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %594 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %593, i32 0, i32 0
  %595 = bitcast %union.ptr_union* %594 to %struct.flagptr**
  %596 = load %struct.flagptr*, %struct.flagptr** %595, align 8
  %597 = icmp ne %struct.flagptr* %596, null
  br label %598

; <label>:598:                                    ; preds = %591, %586
  %599 = phi i1 [ false, %586 ], [ %597, %591 ]
  br i1 %599, label %600, label %624

; <label>:600:                                    ; preds = %598
  %601 = load i8*, i8** %9, align 8
  %602 = load i8, i8* %601, align 1
  %603 = zext i8 %602 to i32
  %604 = icmp eq i32 %603, 0
  br i1 %604, label %605, label %612

; <label>:605:                                    ; preds = %600
  %pgocount52 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 15)
  %606 = add i64 %pgocount52, 1
  store i64 %606, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 15)
  %607 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %608 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %607, i32 0, i32 0
  %609 = bitcast %union.ptr_union* %608 to %struct.flagptr**
  %610 = load %struct.flagptr*, %struct.flagptr** %609, align 8
  %611 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %610, i64 0
  store %struct.flagptr* %611, %struct.flagptr** %6, align 8
  store i32 1, i32* %8, align 4
  br label %623

; <label>:612:                                    ; preds = %600
  %pgocount53 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 6)
  %613 = add i64 %pgocount53, 1
  store i64 %613, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 6)
  %614 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %615 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %614, i32 0, i32 0
  %616 = bitcast %union.ptr_union* %615 to %struct.flagptr**
  %617 = load %struct.flagptr*, %struct.flagptr** %616, align 8
  %618 = load i8*, i8** %9, align 8
  %619 = getelementptr inbounds i8, i8* %618, i32 1
  store i8* %619, i8** %9, align 8
  %620 = load i8, i8* %618, align 1
  %621 = zext i8 %620 to i64
  %622 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %617, i64 %621
  store %struct.flagptr* %622, %struct.flagptr** %6, align 8
  store i32 0, i32* %8, align 4
  br label %623

; <label>:623:                                    ; preds = %612, %605
  br label %586

; <label>:624:                                    ; preds = %598
  %pgocount54 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 25)
  %625 = add i64 %pgocount54, 1
  store i64 %625, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 25)
  br label %626

; <label>:626:                                    ; preds = %624, %575
  %627 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %628 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %627, i32 0, i32 1
  %629 = load i32, i32* %628, align 8
  %630 = icmp eq i32 %629, 0
  br i1 %630, label %631, label %637

; <label>:631:                                    ; preds = %626
  %pgocount55 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 38)
  %632 = add i64 %pgocount55, 1
  store i64 %632, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 38)
  %633 = load %struct.flagent*, %struct.flagent** %5, align 8
  %634 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %635 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %634, i32 0, i32 0
  %636 = bitcast %union.ptr_union* %635 to %struct.flagent**
  store %struct.flagent* %633, %struct.flagent** %636, align 8
  br label %637

; <label>:637:                                    ; preds = %631, %626
  %638 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %639 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %638, i32 0, i32 1
  %640 = load i32, i32* %639, align 8
  %641 = add nsw i32 %640, 1
  store i32 %641, i32* %639, align 8
  %642 = load i32, i32* %8, align 4
  %643 = icmp ne i32 %642, 0
  br i1 %643, label %705, label %644

; <label>:644:                                    ; preds = %637
  %pgocount56 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 39)
  %645 = add i64 %pgocount56, 1
  store i64 %645, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 39)
  %646 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %647 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %646, i32 0, i32 1
  %648 = load i32, i32* %647, align 8
  %649 = icmp sge i32 %648, 4
  br i1 %649, label %650, label %705

; <label>:650:                                    ; preds = %644
  %pgocount57 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 44)
  %651 = add i64 %pgocount57, 1
  store i64 %651, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 44)
  %652 = load %struct.flagent*, %struct.flagent** %5, align 8
  %653 = getelementptr inbounds %struct.flagent, %struct.flagent* %652, i32 0, i32 1
  %654 = load i8*, i8** %653, align 8
  %655 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %656 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %655, i32 0, i32 0
  %657 = bitcast %union.ptr_union* %656 to %struct.flagent**
  %658 = load %struct.flagent*, %struct.flagent** %657, align 8
  %659 = getelementptr inbounds %struct.flagent, %struct.flagent* %658, i32 0, i32 1
  %660 = load i8*, i8** %659, align 8
  %661 = call i32 @strcmp(i8* %654, i8* %660) #5
  %662 = icmp ne i32 %661, 0
  br i1 %662, label %663, label %705

; <label>:663:                                    ; preds = %650
  %664 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %665 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %664, i32 0, i32 0
  %666 = bitcast %union.ptr_union* %665 to %struct.flagent**
  %667 = load %struct.flagent*, %struct.flagent** %666, align 8
  %668 = getelementptr inbounds %struct.flagent, %struct.flagent* %667, i64 -1
  store %struct.flagent* %668, %struct.flagent** %5, align 8
  %669 = load i32, i32* @numpflags, align 4
  %670 = sext i32 %669 to i64
  %671 = load %struct.flagent*, %struct.flagent** %5, align 8
  %672 = load %struct.flagent*, %struct.flagent** @pflaglist, align 8
  %673 = ptrtoint %struct.flagent* %671 to i64
  %674 = ptrtoint %struct.flagent* %672 to i64
  %675 = sub i64 %673, %674
  %676 = sdiv exact i64 %675, 256
  %677 = sub nsw i64 %670, %676
  %678 = trunc i64 %677 to i32
  store i32 %678, i32* %3, align 4
  %679 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 12), align 4
  %680 = add nsw i32 128, %679
  %681 = sext i32 %680 to i64
  %682 = call noalias i8* @calloc(i64 %681, i64 16) #4
  %683 = bitcast i8* %682 to %struct.flagptr*
  %684 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %685 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %684, i32 0, i32 0
  %686 = bitcast %union.ptr_union* %685 to %struct.flagptr**
  store %struct.flagptr* %683, %struct.flagptr** %686, align 8
  %687 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %688 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %687, i32 0, i32 0
  %689 = bitcast %union.ptr_union* %688 to %struct.flagptr**
  %690 = load %struct.flagptr*, %struct.flagptr** %689, align 8
  %691 = icmp eq %struct.flagptr* %690, null
  br i1 %691, label %692, label %701

; <label>:692:                                    ; preds = %663
  %693 = load i32, i32* @cbench_print, align 4
  %694 = icmp ne i32 %693, 0
  br i1 %694, label %695, label %699

; <label>:695:                                    ; preds = %692
  %pgocount58 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 66)
  %696 = add i64 %pgocount58, 1
  store i64 %696, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 66)
  %697 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %698 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %697, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i32 0, i32 0))
  br label %699

; <label>:699:                                    ; preds = %695, %692
  %pgocount59 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 64)
  %700 = add i64 %pgocount59, 1
  store i64 %700, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 64)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:701:                                    ; preds = %663
  %pgocount60 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 49)
  %702 = add i64 %pgocount60, 1
  store i64 %702, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 49)
  %703 = load %struct.flagptr*, %struct.flagptr** %6, align 8
  %704 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %703, i32 0, i32 1
  store i32 0, i32* %704, align 8
  br label %705

; <label>:705:                                    ; preds = %701, %650, %644, %637
  br label %706

; <label>:706:                                    ; preds = %705
  %707 = load i32, i32* %3, align 4
  %708 = add nsw i32 %707, -1
  store i32 %708, i32* %3, align 4
  %709 = load %struct.flagent*, %struct.flagent** %5, align 8
  %710 = getelementptr inbounds %struct.flagent, %struct.flagent* %709, i32 1
  store %struct.flagent* %710, %struct.flagent** %5, align 8
  br label %566

; <label>:711:                                    ; preds = %566
  %712 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %713 = icmp eq i32 %712, 0
  br i1 %713, label %714, label %716

; <label>:714:                                    ; preds = %711
  %pgocount61 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 60)
  %715 = add i64 %pgocount61, 1
  store i64 %715, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 60)
  store %struct.strchartype* null, %struct.strchartype** @chartypes, align 8
  br label %820

; <label>:716:                                    ; preds = %711
  %717 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %718 = sext i32 %717 to i64
  %719 = mul i64 %718, 24
  %720 = call noalias i8* @malloc(i64 %719) #4
  %721 = bitcast i8* %720 to %struct.strchartype*
  store %struct.strchartype* %721, %struct.strchartype** @chartypes, align 8
  %722 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %723 = icmp eq %struct.strchartype* %722, null
  br i1 %723, label %724, label %733

; <label>:724:                                    ; preds = %716
  %725 = load i32, i32* @cbench_print, align 4
  %726 = icmp ne i32 %725, 0
  br i1 %726, label %727, label %731

; <label>:727:                                    ; preds = %724
  %pgocount62 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 62)
  %728 = add i64 %pgocount62, 1
  store i64 %728, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 62)
  %729 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %730 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %729, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.9, i32 0, i32 0))
  br label %731

; <label>:731:                                    ; preds = %727, %724
  %pgocount63 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 61)
  %732 = add i64 %pgocount63, 1
  store i64 %732, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 61)
  store i32 -1, i32* %1, align 4
  br label %821

; <label>:733:                                    ; preds = %716
  %pgocount64 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 59)
  %734 = add i64 %pgocount64, 1
  store i64 %734, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 59)
  store i32 0, i32* %3, align 4
  %735 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 14), align 4
  store i32 %735, i32* %7, align 4
  br label %736

; <label>:736:                                    ; preds = %816, %733
  %737 = load i32, i32* %3, align 4
  %738 = load i32, i32* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 13), align 4
  %739 = icmp slt i32 %737, %738
  br i1 %739, label %740, label %819

; <label>:740:                                    ; preds = %736
  %pgocount65 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 35)
  %741 = add i64 %pgocount65, 1
  store i64 %741, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 35)
  %742 = load i8*, i8** @hashstrings, align 8
  %743 = load i32, i32* %7, align 4
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds i8, i8* %742, i64 %744
  %746 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %747 = load i32, i32* %3, align 4
  %748 = sext i32 %747 to i64
  %749 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %746, i64 %748
  %750 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %749, i32 0, i32 0
  store i8* %745, i8** %750, align 8
  %751 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %752 = load i32, i32* %3, align 4
  %753 = sext i32 %752 to i64
  %754 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %751, i64 %753
  %755 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %754, i32 0, i32 0
  %756 = load i8*, i8** %755, align 8
  %757 = call i64 @strlen(i8* %756) #5
  %758 = add i64 %757, 1
  %759 = load i32, i32* %7, align 4
  %760 = sext i32 %759 to i64
  %761 = add i64 %760, %758
  %762 = trunc i64 %761 to i32
  store i32 %762, i32* %7, align 4
  %763 = load i8*, i8** @hashstrings, align 8
  %764 = load i32, i32* %7, align 4
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds i8, i8* %763, i64 %765
  %767 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %768 = load i32, i32* %3, align 4
  %769 = sext i32 %768 to i64
  %770 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %767, i64 %769
  %771 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %770, i32 0, i32 1
  store i8* %766, i8** %771, align 8
  %772 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %773 = load i32, i32* %3, align 4
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %772, i64 %774
  %776 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %775, i32 0, i32 1
  %777 = load i8*, i8** %776, align 8
  %778 = call i64 @strlen(i8* %777) #5
  %779 = add i64 %778, 1
  %780 = load i32, i32* %7, align 4
  %781 = sext i32 %780 to i64
  %782 = add i64 %781, %779
  %783 = trunc i64 %782 to i32
  store i32 %783, i32* %7, align 4
  %784 = load i8*, i8** @hashstrings, align 8
  %785 = load i32, i32* %7, align 4
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds i8, i8* %784, i64 %786
  %788 = load %struct.strchartype*, %struct.strchartype** @chartypes, align 8
  %789 = load i32, i32* %3, align 4
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %788, i64 %790
  %792 = getelementptr inbounds %struct.strchartype, %struct.strchartype* %791, i32 0, i32 2
  store i8* %787, i8** %792, align 8
  br label %793

; <label>:793:                                    ; preds = %801, %740
  %794 = load i8*, i8** @hashstrings, align 8
  %795 = load i32, i32* %7, align 4
  %796 = sext i32 %795 to i64
  %797 = getelementptr inbounds i8, i8* %794, i64 %796
  %798 = load i8, i8* %797, align 1
  %799 = sext i8 %798 to i32
  %800 = icmp ne i32 %799, 0
  br i1 %800, label %801, label %813

; <label>:801:                                    ; preds = %793
  %pgocount66 = load i64, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 7)
  %802 = add i64 %pgocount66, 1
  store i64 %802, i64* getelementptr inbounds ([67 x i64], [67 x i64]* @__profc_linit, i64 0, i64 7)
  %803 = load i8*, i8** @hashstrings, align 8
  %804 = load i32, i32* %7, align 4
  %805 = sext i32 %804 to i64
  %806 = getelementptr inbounds i8, i8* %803, i64 %805
  %807 = call i64 @strlen(i8* %806) #5
  %808 = add i64 %807, 1
  %809 = load i32, i32* %7, align 4
  %810 = sext i32 %809 to i64
  %811 = add i64 %810, %808
  %812 = trunc i64 %811 to i32
  store i32 %812, i32* %7, align 4
  br label %793

; <label>:813:                                    ; preds = %793
  %814 = load i32, i32* %7, align 4
  %815 = add nsw i32 %814, 1
  store i32 %815, i32* %7, align 4
  br label %816

; <label>:816:                                    ; preds = %813
  %817 = load i32, i32* %3, align 4
  %818 = add nsw i32 %817, 1
  store i32 %818, i32* %3, align 4
  br label %736

; <label>:819:                                    ; preds = %736
  br label %820

; <label>:820:                                    ; preds = %819, %714
  store i32 1, i32* @inited, align 4
  store i32 0, i32* %1, align 4
  br label %821

; <label>:821:                                    ; preds = %820, %731, %699, %551, %297, %270, %227, %203, %146, %126, %97, %82, %67, %24, %12
  %822 = load i32, i32* %1, align 4
  ret i32 %822
}

declare i32 @open(i8*, i32, ...) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i64 @read(i32, i8*, i64) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #2

declare i32 @close(i32) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind uwtable
define %struct.dent* @lookup(i8*, i32) #0 {
  %3 = alloca %struct.dent*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.dent*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [120 x i8], align 16
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %9 = load %struct.dent*, %struct.dent** @hashtbl, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = load i32, i32* @hashsize, align 4
  %12 = call i32 @hash(i8* %10, i32 %11)
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.dent, %struct.dent* %9, i64 %13
  store %struct.dent* %14, %struct.dent** %6, align 8
  %15 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %16 = load i8*, i8** %4, align 8
  %17 = call i32 @ichartostr(i8* %15, i8* %16, i32 120, i32 1)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %29

; <label>:19:                                     ; preds = %2
  %20 = load i32, i32* @cbench_print, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 6)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 6)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.10, i32 0, i32 0), i8* %25, i32 466, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0))
  br label %27

; <label>:27:                                     ; preds = %22, %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 4)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 4)
  br label %29

; <label>:29:                                     ; preds = %27, %2
  br label %30

; <label>:30:                                     ; preds = %74, %29
  %31 = load %struct.dent*, %struct.dent** %6, align 8
  %32 = icmp ne %struct.dent* %31, null
  br i1 %32, label %33, label %79

; <label>:33:                                     ; preds = %30
  %34 = load %struct.dent*, %struct.dent** %6, align 8
  %35 = getelementptr inbounds %struct.dent, %struct.dent* %34, i32 0, i32 1
  %36 = load i8*, i8** %35, align 8
  store i8* %36, i8** %7, align 8
  %37 = load i8*, i8** %7, align 8
  %38 = icmp ne i8* %37, null
  br i1 %38, label %39, label %60

; <label>:39:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 2)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 2)
  %41 = load i8*, i8** %7, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i64 0, i64 0
  %46 = load i8, i8* %45, align 16
  %47 = sext i8 %46 to i32
  %48 = icmp eq i32 %44, %47
  br i1 %48, label %49, label %60

; <label>:49:                                     ; preds = %39
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 3)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 3)
  %51 = load i8*, i8** %7, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 1
  %53 = getelementptr inbounds [120 x i8], [120 x i8]* %8, i32 0, i32 0
  %54 = getelementptr inbounds i8, i8* %53, i64 1
  %55 = call i32 @strcmp(i8* %52, i8* %54) #5
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %60

; <label>:57:                                     ; preds = %49
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 8)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 8)
  %59 = load %struct.dent*, %struct.dent** %6, align 8
  store %struct.dent* %59, %struct.dent** %3, align 8
  br label %89

; <label>:60:                                     ; preds = %49, %39, %33
  br label %61

; <label>:61:                                     ; preds = %68, %60
  %62 = load %struct.dent*, %struct.dent** %6, align 8
  %63 = getelementptr inbounds %struct.dent, %struct.dent* %62, i32 0, i32 2
  %64 = getelementptr inbounds [1 x i64], [1 x i64]* %63, i64 0, i64 0
  %65 = load i64, i64* %64, align 8
  %66 = and i64 %65, 1073741824
  %67 = icmp ne i64 %66, 0
  br i1 %67, label %68, label %73

; <label>:68:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 0)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 0)
  %70 = load %struct.dent*, %struct.dent** %6, align 8
  %71 = getelementptr inbounds %struct.dent, %struct.dent* %70, i32 0, i32 0
  %72 = load %struct.dent*, %struct.dent** %71, align 8
  store %struct.dent* %72, %struct.dent** %6, align 8
  br label %61

; <label>:73:                                     ; preds = %61
  br label %74

; <label>:74:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 1)
  %75 = add i64 %pgocount6, 1
  store i64 %75, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 1)
  %76 = load %struct.dent*, %struct.dent** %6, align 8
  %77 = getelementptr inbounds %struct.dent, %struct.dent* %76, i32 0, i32 0
  %78 = load %struct.dent*, %struct.dent** %77, align 8
  store %struct.dent* %78, %struct.dent** %6, align 8
  br label %30

; <label>:79:                                     ; preds = %30
  %80 = load i32, i32* %5, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %87

; <label>:82:                                     ; preds = %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 5)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 5)
  %84 = load i8*, i8** %4, align 8
  %85 = call %struct.dent* @treelookup(i8* %84)
  store %struct.dent* %85, %struct.dent** %6, align 8
  %86 = load %struct.dent*, %struct.dent** %6, align 8
  store %struct.dent* %86, %struct.dent** %3, align 8
  br label %89

; <label>:87:                                     ; preds = %79
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 7)
  %88 = add i64 %pgocount8, 1
  store i64 %88, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_lookup, i64 0, i64 7)
  store %struct.dent* null, %struct.dent** %3, align 8
  br label %89

; <label>:89:                                     ; preds = %87, %82, %57
  %90 = load %struct.dent*, %struct.dent** %3, align 8
  ret %struct.dent* %90
}

declare i32 @hash(i8*, i32) #1

declare i32 @ichartostr(i8*, i8*, i32, i32) #1

declare %struct.dent* @treelookup(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
