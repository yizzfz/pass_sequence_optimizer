; ModuleID = 'tabinit.2.ll'
source_filename = "tabinit.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@cos64 = internal global [16 x double] zeroinitializer, align 16
@cos32 = internal global [8 x double] zeroinitializer, align 16
@cos16 = internal global [4 x double] zeroinitializer, align 16
@cos8 = internal global [2 x double] zeroinitializer, align 16
@cos4 = internal global [1 x double] zeroinitializer, align 8
@pnts = global [5 x double*] [double* getelementptr inbounds ([16 x double], [16 x double]* @cos64, i32 0, i32 0), double* getelementptr inbounds ([8 x double], [8 x double]* @cos32, i32 0, i32 0), double* getelementptr inbounds ([4 x double], [4 x double]* @cos16, i32 0, i32 0), double* getelementptr inbounds ([2 x double], [2 x double]* @cos8, i32 0, i32 0), double* getelementptr inbounds ([1 x double], [1 x double]* @cos4, i32 0, i32 0)], align 16
@decwin = common global [544 x double] zeroinitializer, align 16
@intwinbase = internal global [257 x i64] [i64 0, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -2, i64 -2, i64 -2, i64 -2, i64 -3, i64 -3, i64 -4, i64 -4, i64 -5, i64 -5, i64 -6, i64 -7, i64 -7, i64 -8, i64 -9, i64 -10, i64 -11, i64 -13, i64 -14, i64 -16, i64 -17, i64 -19, i64 -21, i64 -24, i64 -26, i64 -29, i64 -31, i64 -35, i64 -38, i64 -41, i64 -45, i64 -49, i64 -53, i64 -58, i64 -63, i64 -68, i64 -73, i64 -79, i64 -85, i64 -91, i64 -97, i64 -104, i64 -111, i64 -117, i64 -125, i64 -132, i64 -139, i64 -147, i64 -154, i64 -161, i64 -169, i64 -176, i64 -183, i64 -190, i64 -196, i64 -202, i64 -208, i64 -213, i64 -218, i64 -222, i64 -225, i64 -227, i64 -228, i64 -228, i64 -227, i64 -224, i64 -221, i64 -215, i64 -208, i64 -200, i64 -189, i64 -177, i64 -163, i64 -146, i64 -127, i64 -106, i64 -83, i64 -57, i64 -29, i64 2, i64 36, i64 72, i64 111, i64 153, i64 197, i64 244, i64 294, i64 347, i64 401, i64 459, i64 519, i64 581, i64 645, i64 711, i64 779, i64 848, i64 919, i64 991, i64 1064, i64 1137, i64 1210, i64 1283, i64 1356, i64 1428, i64 1498, i64 1567, i64 1634, i64 1698, i64 1759, i64 1817, i64 1870, i64 1919, i64 1962, i64 2001, i64 2032, i64 2057, i64 2075, i64 2085, i64 2087, i64 2080, i64 2063, i64 2037, i64 2000, i64 1952, i64 1893, i64 1822, i64 1739, i64 1644, i64 1535, i64 1414, i64 1280, i64 1131, i64 970, i64 794, i64 605, i64 402, i64 185, i64 -45, i64 -288, i64 -545, i64 -814, i64 -1095, i64 -1388, i64 -1692, i64 -2006, i64 -2330, i64 -2663, i64 -3004, i64 -3351, i64 -3705, i64 -4063, i64 -4425, i64 -4788, i64 -5153, i64 -5517, i64 -5879, i64 -6237, i64 -6589, i64 -6935, i64 -7271, i64 -7597, i64 -7910, i64 -8209, i64 -8491, i64 -8755, i64 -8998, i64 -9219, i64 -9416, i64 -9585, i64 -9727, i64 -9838, i64 -9916, i64 -9959, i64 -9966, i64 -9935, i64 -9863, i64 -9750, i64 -9592, i64 -9389, i64 -9139, i64 -8840, i64 -8492, i64 -8092, i64 -7640, i64 -7134, i64 -6574, i64 -5959, i64 -5288, i64 -4561, i64 -3776, i64 -2935, i64 -2037, i64 -1082, i64 -70, i64 998, i64 2122, i64 3300, i64 4533, i64 5818, i64 7154, i64 8540, i64 9975, i64 11455, i64 12980, i64 14548, i64 16155, i64 17799, i64 19478, i64 21189, i64 22929, i64 24694, i64 26482, i64 28289, i64 30112, i64 31947, i64 33791, i64 35640, i64 37489, i64 39336, i64 41176, i64 43006, i64 44821, i64 46617, i64 48390, i64 50137, i64 51853, i64 53534, i64 55178, i64 56778, i64 58333, i64 59838, i64 61289, i64 62684, i64 64019, i64 65290, i64 66494, i64 67629, i64 68692, i64 69679, i64 70590, i64 71420, i64 72169, i64 72835, i64 73415, i64 73908, i64 74313, i64 74630, i64 74856, i64 74992, i64 75038], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_make_decode_tables = private constant [18 x i8] c"make_decode_tables"
@__profc_make_decode_tables = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_make_decode_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4959506860639307869, i64 174411566455, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i32 0, i32 0), i8* bitcast (void (i64)* @make_decode_tables to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [28 x i8] c"\12\1Ax\DA\CBM\CCN\8DOIM\CEOI\8D/IL\CAI-\06\00DL\07<", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_make_decode_tables to i8*), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @make_decode_tables(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  store i64 %0, i64* %2, align 8
  store i32 0, i32* %3, align 4
  br label %10

; <label>:10:                                     ; preds = %47, %1
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %51

; <label>:13:                                     ; preds = %10
  %14 = load i32, i32* %3, align 4
  %15 = ashr i32 16, %14
  store i32 %15, i32* %6, align 4
  %16 = load i32, i32* %3, align 4
  %17 = ashr i32 64, %16
  store i32 %17, i32* %7, align 4
  %18 = load i32, i32* %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x double*], [5 x double*]* @pnts, i64 0, i64 %19
  %21 = load double*, double** %20, align 8
  store double* %21, double** %9, align 8
  store i32 0, i32* %5, align 4
  br label %22

; <label>:22:                                     ; preds = %42, %13
  %23 = load i32, i32* %5, align 4
  %24 = load i32, i32* %6, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %46

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %5, align 4
  %28 = sitofp i32 %27 to double
  %29 = fmul double %28, 2.000000e+00
  %30 = fadd double %29, 1.000000e+00
  %31 = fmul double 0x400921FB54442D18, %30
  %32 = load i32, i32* %7, align 4
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %31, %33
  %35 = call double @cos(double %34) #2
  %36 = fmul double 2.000000e+00, %35
  %37 = fdiv double 1.000000e+00, %36
  %38 = load double*, double** %9, align 8
  %39 = load i32, i32* %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double* %38, i64 %40
  store double %37, double* %41, align 8
  br label %42

; <label>:42:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 0)
  %44 = load i32, i32* %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %5, align 4
  br label %22

; <label>:46:                                     ; preds = %22
  br label %47

; <label>:47:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 1)
  %49 = load i32, i32* %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %3, align 4
  br label %10

; <label>:51:                                     ; preds = %10
  store double* getelementptr inbounds ([544 x double], [544 x double]* @decwin, i32 0, i32 0), double** %8, align 8
  %52 = load i64, i64* %2, align 8
  %53 = sub nsw i64 0, %52
  store i64 %53, i64* %2, align 8
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %54

; <label>:54:                                     ; preds = %92, %51
  %55 = load i32, i32* %3, align 4
  %56 = icmp slt i32 %55, 256
  br i1 %56, label %57, label %100

; <label>:57:                                     ; preds = %54
  %58 = load double*, double** %8, align 8
  %59 = icmp ult double* %58, getelementptr inbounds ([544 x double], [544 x double]* @decwin, i32 0, i64 528)
  br i1 %59, label %60, label %75

; <label>:60:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 4)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 4)
  %62 = load i32, i32* %4, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [257 x i64], [257 x i64]* @intwinbase, i64 0, i64 %63
  %65 = load i64, i64* %64, align 8
  %66 = sitofp i64 %65 to double
  %67 = fdiv double %66, 6.553600e+04
  %68 = load i64, i64* %2, align 8
  %69 = sitofp i64 %68 to double
  %70 = fmul double %67, %69
  %71 = load double*, double** %8, align 8
  %72 = getelementptr inbounds double, double* %71, i64 0
  store double %70, double* %72, align 8
  %73 = load double*, double** %8, align 8
  %74 = getelementptr inbounds double, double* %73, i64 16
  store double %70, double* %74, align 8
  br label %75

; <label>:75:                                     ; preds = %60, %57
  %76 = load i32, i32* %3, align 4
  %77 = srem i32 %76, 32
  %78 = icmp eq i32 %77, 31
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %75
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 5)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 5)
  %81 = load double*, double** %8, align 8
  %82 = getelementptr inbounds double, double* %81, i64 -1023
  store double* %82, double** %8, align 8
  br label %83

; <label>:83:                                     ; preds = %79, %75
  %84 = load i32, i32* %3, align 4
  %85 = srem i32 %84, 64
  %86 = icmp eq i32 %85, 63
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %83
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 6)
  %88 = add i64 %pgocount4, 1
  store i64 %88, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 6)
  %89 = load i64, i64* %2, align 8
  %90 = sub nsw i64 0, %89
  store i64 %90, i64* %2, align 8
  br label %91

; <label>:91:                                     ; preds = %87, %83
  br label %92

; <label>:92:                                     ; preds = %91
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 2)
  %93 = add i64 %pgocount5, 1
  store i64 %93, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 2)
  %94 = load i32, i32* %3, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %3, align 4
  %96 = load i32, i32* %4, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %4, align 4
  %98 = load double*, double** %8, align 8
  %99 = getelementptr inbounds double, double* %98, i64 32
  store double* %99, double** %8, align 8
  br label %54

; <label>:100:                                    ; preds = %54
  br label %101

; <label>:101:                                    ; preds = %139, %100
  %102 = load i32, i32* %3, align 4
  %103 = icmp slt i32 %102, 512
  br i1 %103, label %104, label %147

; <label>:104:                                    ; preds = %101
  %105 = load double*, double** %8, align 8
  %106 = icmp ult double* %105, getelementptr inbounds ([544 x double], [544 x double]* @decwin, i32 0, i64 528)
  br i1 %106, label %107, label %122

; <label>:107:                                    ; preds = %104
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 7)
  %108 = add i64 %pgocount6, 1
  store i64 %108, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 7)
  %109 = load i32, i32* %4, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [257 x i64], [257 x i64]* @intwinbase, i64 0, i64 %110
  %112 = load i64, i64* %111, align 8
  %113 = sitofp i64 %112 to double
  %114 = fdiv double %113, 6.553600e+04
  %115 = load i64, i64* %2, align 8
  %116 = sitofp i64 %115 to double
  %117 = fmul double %114, %116
  %118 = load double*, double** %8, align 8
  %119 = getelementptr inbounds double, double* %118, i64 0
  store double %117, double* %119, align 8
  %120 = load double*, double** %8, align 8
  %121 = getelementptr inbounds double, double* %120, i64 16
  store double %117, double* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %107, %104
  %123 = load i32, i32* %3, align 4
  %124 = srem i32 %123, 32
  %125 = icmp eq i32 %124, 31
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %122
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 8)
  %127 = add i64 %pgocount7, 1
  store i64 %127, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 8)
  %128 = load double*, double** %8, align 8
  %129 = getelementptr inbounds double, double* %128, i64 -1023
  store double* %129, double** %8, align 8
  br label %130

; <label>:130:                                    ; preds = %126, %122
  %131 = load i32, i32* %3, align 4
  %132 = srem i32 %131, 64
  %133 = icmp eq i32 %132, 63
  br i1 %133, label %134, label %138

; <label>:134:                                    ; preds = %130
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 9)
  %135 = add i64 %pgocount8, 1
  store i64 %135, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 9)
  %136 = load i64, i64* %2, align 8
  %137 = sub nsw i64 0, %136
  store i64 %137, i64* %2, align 8
  br label %138

; <label>:138:                                    ; preds = %134, %130
  br label %139

; <label>:139:                                    ; preds = %138
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 3)
  %140 = add i64 %pgocount9, 1
  store i64 %140, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 3)
  %141 = load i32, i32* %3, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %3, align 4
  %143 = load i32, i32* %4, align 4
  %144 = add nsw i32 %143, -1
  store i32 %144, i32* %4, align 4
  %145 = load double*, double** %8, align 8
  %146 = getelementptr inbounds double, double* %145, i64 32
  store double* %146, double** %8, align 8
  br label %101

; <label>:147:                                    ; preds = %101
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 10)
  %148 = add i64 %pgocount10, 1
  store i64 %148, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_make_decode_tables, i64 0, i64 10)
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
