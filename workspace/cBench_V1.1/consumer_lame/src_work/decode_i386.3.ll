; ModuleID = 'decode_i386.2.ll'
source_filename = "decode_i386.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mpstr = type { %struct.buf*, %struct.buf*, i32, i32, i32, %struct.frame, [2 x [2304 x i8]], [2 x [2 x [576 x double]]], [2 x i32], i64, i32, [2 x [2 x [272 x double]]], i32 }
%struct.buf = type { i8*, i64, i64, %struct.buf*, %struct.buf* }
%struct.frame = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

$__llvm_profile_raw_version = comdat any

@synth_1to1.step = internal constant i32 2, align 4
@gmp = external global %struct.mpstr*, align 8
@decwin = external global [544 x double], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_synth_1to1_mono = private constant [15 x i8] c"synth_1to1_mono"
@__profn_synth_1to1 = private constant [10 x i8] c"synth_1to1"
@__profc_synth_1to1_mono = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_synth_1to1_mono = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4461228102957677154, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_synth_1to1_mono, i32 0, i32 0), i8* bitcast (i32 (double*, i8*, i32*)* @synth_1to1_mono to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_synth_1to1 = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_synth_1to1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -456070132614155840, i64 189966759623, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i32 0, i32 0), i8* bitcast (i32 (double*, i32, i8*, i32*)* @synth_1to1 to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [28 x i8] c"\1A\1Ax\DA+\AE\CC+\C9\887,\C97\8C\CF\CD\CF\CBg,\86\F3\01\88\9E\09\CE", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_synth_1to1_mono to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_synth_1to1 to i8*), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @synth_1to1_mono(double*, i8*, i32*) #0 {
  %4 = alloca double*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca [64 x i16], align 16
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store double* %0, double** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32* %2, i32** %6, align 8
  %12 = getelementptr inbounds [64 x i16], [64 x i16]* %7, i32 0, i32 0
  store i16* %12, i16** %8, align 8
  store i32 0, i32* %11, align 4
  %13 = load double*, double** %4, align 8
  %14 = getelementptr inbounds [64 x i16], [64 x i16]* %7, i32 0, i32 0
  %15 = bitcast i16* %14 to i8*
  %16 = call i32 @synth_1to1(double* %13, i32 0, i8* %15, i32* %11)
  store i32 %16, i32* %10, align 4
  %17 = load i32*, i32** %6, align 8
  %18 = load i32, i32* %17, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %5, align 8
  store i32 0, i32* %9, align 4
  br label %22

; <label>:22:                                     ; preds = %34, %3
  %23 = load i32, i32* %9, align 4
  %24 = icmp slt i32 %23, 32
  br i1 %24, label %25, label %38

; <label>:25:                                     ; preds = %22
  %26 = load i16*, i16** %8, align 8
  %27 = load i16, i16* %26, align 2
  %28 = load i8*, i8** %5, align 8
  %29 = bitcast i8* %28 to i16*
  store i16 %27, i16* %29, align 2
  %30 = load i8*, i8** %5, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 2
  store i8* %31, i8** %5, align 8
  %32 = load i16*, i16** %8, align 8
  %33 = getelementptr inbounds i16, i16* %32, i64 2
  store i16* %33, i16** %8, align 8
  br label %34

; <label>:34:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_synth_1to1_mono, i64 0, i64 0)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_synth_1to1_mono, i64 0, i64 0)
  %36 = load i32, i32* %9, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %9, align 4
  br label %22

; <label>:38:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_synth_1to1_mono, i64 0, i64 1)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_synth_1to1_mono, i64 0, i64 1)
  %40 = load i32*, i32** %6, align 8
  %41 = load i32, i32* %40, align 4
  %42 = add nsw i32 %41, 64
  store i32 %42, i32* %40, align 4
  %43 = load i32, i32* %10, align 4
  ret i32 %43
}

; Function Attrs: nounwind uwtable
define i32 @synth_1to1(double*, i32, i8*, i32*) #0 {
  %5 = alloca double*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i16*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [272 x double]*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double*, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store double* %0, double** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i32* %3, i32** %8, align 8
  %20 = load i8*, i8** %7, align 8
  %21 = load i32*, i32** %8, align 8
  %22 = load i32, i32* %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %20, i64 %23
  %25 = bitcast i8* %24 to i16*
  store i16* %25, i16** %10, align 8
  store i32 0, i32* %13, align 4
  %26 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %27 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %26, i32 0, i32 12
  %28 = load i32, i32* %27, align 8
  store i32 %28, i32* %9, align 4
  %29 = load i32, i32* %6, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %41, label %31

; <label>:31:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 8)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 8)
  %33 = load i32, i32* %9, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %9, align 4
  %35 = load i32, i32* %9, align 4
  %36 = and i32 %35, 15
  store i32 %36, i32* %9, align 4
  %37 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %38 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %37, i32 0, i32 11
  %39 = getelementptr inbounds [2 x [2 x [272 x double]]], [2 x [2 x [272 x double]]]* %38, i64 0, i64 0
  %40 = getelementptr inbounds [2 x [272 x double]], [2 x [272 x double]]* %39, i32 0, i32 0
  store [272 x double]* %40, [272 x double]** %12, align 8
  br label %48

; <label>:41:                                     ; preds = %4
  %42 = load i16*, i16** %10, align 8
  %43 = getelementptr inbounds i16, i16* %42, i32 1
  store i16* %43, i16** %10, align 8
  %44 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %45 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %44, i32 0, i32 11
  %46 = getelementptr inbounds [2 x [2 x [272 x double]]], [2 x [2 x [272 x double]]]* %45, i64 0, i64 1
  %47 = getelementptr inbounds [2 x [272 x double]], [2 x [272 x double]]* %46, i32 0, i32 0
  store [272 x double]* %47, [272 x double]** %12, align 8
  br label %48

; <label>:48:                                     ; preds = %41, %31
  %49 = load i32, i32* %9, align 4
  %50 = and i32 %49, 1
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %72

; <label>:52:                                     ; preds = %48
  %53 = load [272 x double]*, [272 x double]** %12, align 8
  %54 = getelementptr inbounds [272 x double], [272 x double]* %53, i64 0
  %55 = getelementptr inbounds [272 x double], [272 x double]* %54, i32 0, i32 0
  store double* %55, double** %11, align 8
  %56 = load i32, i32* %9, align 4
  store i32 %56, i32* %14, align 4
  %57 = load [272 x double]*, [272 x double]** %12, align 8
  %58 = getelementptr inbounds [272 x double], [272 x double]* %57, i64 1
  %59 = getelementptr inbounds [272 x double], [272 x double]* %58, i32 0, i32 0
  %60 = load i32, i32* %9, align 4
  %61 = add nsw i32 %60, 1
  %62 = and i32 %61, 15
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double* %59, i64 %63
  %65 = load [272 x double]*, [272 x double]** %12, align 8
  %66 = getelementptr inbounds [272 x double], [272 x double]* %65, i64 0
  %67 = getelementptr inbounds [272 x double], [272 x double]* %66, i32 0, i32 0
  %68 = load i32, i32* %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  %71 = load double*, double** %5, align 8
  call void @dct64(double* %64, double* %70, double* %71)
  br label %93

; <label>:72:                                     ; preds = %48
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 6)
  %73 = add i64 %pgocount1, 1
  store i64 %73, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 6)
  %74 = load [272 x double]*, [272 x double]** %12, align 8
  %75 = getelementptr inbounds [272 x double], [272 x double]* %74, i64 1
  %76 = getelementptr inbounds [272 x double], [272 x double]* %75, i32 0, i32 0
  store double* %76, double** %11, align 8
  %77 = load i32, i32* %9, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %14, align 4
  %79 = load [272 x double]*, [272 x double]** %12, align 8
  %80 = getelementptr inbounds [272 x double], [272 x double]* %79, i64 0
  %81 = getelementptr inbounds [272 x double], [272 x double]* %80, i32 0, i32 0
  %82 = load i32, i32* %9, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  %85 = load [272 x double]*, [272 x double]** %12, align 8
  %86 = getelementptr inbounds [272 x double], [272 x double]* %85, i64 1
  %87 = getelementptr inbounds [272 x double], [272 x double]* %86, i32 0, i32 0
  %88 = load i32, i32* %9, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double* %87, i64 %89
  %91 = getelementptr inbounds double, double* %90, i64 1
  %92 = load double*, double** %5, align 8
  call void @dct64(double* %84, double* %91, double* %92)
  br label %93

; <label>:93:                                     ; preds = %72, %52
  %94 = load i32, i32* %9, align 4
  %95 = load %struct.mpstr*, %struct.mpstr** @gmp, align 8
  %96 = getelementptr inbounds %struct.mpstr, %struct.mpstr* %95, i32 0, i32 12
  store i32 %94, i32* %96, align 8
  %97 = load i32, i32* %14, align 4
  %98 = sext i32 %97 to i64
  %99 = sub i64 0, %98
  %100 = getelementptr inbounds double, double* getelementptr inbounds ([544 x double], [544 x double]* @decwin, i32 0, i64 16), i64 %99
  store double* %100, double** %16, align 8
  store i32 16, i32* %15, align 4
  br label %101

; <label>:101:                                    ; preds = %269, %93
  %102 = load i32, i32* %15, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %278

; <label>:104:                                    ; preds = %101
  %105 = load double*, double** %16, align 8
  %106 = getelementptr inbounds double, double* %105, i64 0
  %107 = load double, double* %106, align 8
  %108 = load double*, double** %11, align 8
  %109 = getelementptr inbounds double, double* %108, i64 0
  %110 = load double, double* %109, align 8
  %111 = fmul double %107, %110
  store double %111, double* %17, align 8
  %112 = load double*, double** %16, align 8
  %113 = getelementptr inbounds double, double* %112, i64 1
  %114 = load double, double* %113, align 8
  %115 = load double*, double** %11, align 8
  %116 = getelementptr inbounds double, double* %115, i64 1
  %117 = load double, double* %116, align 8
  %118 = fmul double %114, %117
  %119 = load double, double* %17, align 8
  %120 = fsub double %119, %118
  store double %120, double* %17, align 8
  %121 = load double*, double** %16, align 8
  %122 = getelementptr inbounds double, double* %121, i64 2
  %123 = load double, double* %122, align 8
  %124 = load double*, double** %11, align 8
  %125 = getelementptr inbounds double, double* %124, i64 2
  %126 = load double, double* %125, align 8
  %127 = fmul double %123, %126
  %128 = load double, double* %17, align 8
  %129 = fadd double %128, %127
  store double %129, double* %17, align 8
  %130 = load double*, double** %16, align 8
  %131 = getelementptr inbounds double, double* %130, i64 3
  %132 = load double, double* %131, align 8
  %133 = load double*, double** %11, align 8
  %134 = getelementptr inbounds double, double* %133, i64 3
  %135 = load double, double* %134, align 8
  %136 = fmul double %132, %135
  %137 = load double, double* %17, align 8
  %138 = fsub double %137, %136
  store double %138, double* %17, align 8
  %139 = load double*, double** %16, align 8
  %140 = getelementptr inbounds double, double* %139, i64 4
  %141 = load double, double* %140, align 8
  %142 = load double*, double** %11, align 8
  %143 = getelementptr inbounds double, double* %142, i64 4
  %144 = load double, double* %143, align 8
  %145 = fmul double %141, %144
  %146 = load double, double* %17, align 8
  %147 = fadd double %146, %145
  store double %147, double* %17, align 8
  %148 = load double*, double** %16, align 8
  %149 = getelementptr inbounds double, double* %148, i64 5
  %150 = load double, double* %149, align 8
  %151 = load double*, double** %11, align 8
  %152 = getelementptr inbounds double, double* %151, i64 5
  %153 = load double, double* %152, align 8
  %154 = fmul double %150, %153
  %155 = load double, double* %17, align 8
  %156 = fsub double %155, %154
  store double %156, double* %17, align 8
  %157 = load double*, double** %16, align 8
  %158 = getelementptr inbounds double, double* %157, i64 6
  %159 = load double, double* %158, align 8
  %160 = load double*, double** %11, align 8
  %161 = getelementptr inbounds double, double* %160, i64 6
  %162 = load double, double* %161, align 8
  %163 = fmul double %159, %162
  %164 = load double, double* %17, align 8
  %165 = fadd double %164, %163
  store double %165, double* %17, align 8
  %166 = load double*, double** %16, align 8
  %167 = getelementptr inbounds double, double* %166, i64 7
  %168 = load double, double* %167, align 8
  %169 = load double*, double** %11, align 8
  %170 = getelementptr inbounds double, double* %169, i64 7
  %171 = load double, double* %170, align 8
  %172 = fmul double %168, %171
  %173 = load double, double* %17, align 8
  %174 = fsub double %173, %172
  store double %174, double* %17, align 8
  %175 = load double*, double** %16, align 8
  %176 = getelementptr inbounds double, double* %175, i64 8
  %177 = load double, double* %176, align 8
  %178 = load double*, double** %11, align 8
  %179 = getelementptr inbounds double, double* %178, i64 8
  %180 = load double, double* %179, align 8
  %181 = fmul double %177, %180
  %182 = load double, double* %17, align 8
  %183 = fadd double %182, %181
  store double %183, double* %17, align 8
  %184 = load double*, double** %16, align 8
  %185 = getelementptr inbounds double, double* %184, i64 9
  %186 = load double, double* %185, align 8
  %187 = load double*, double** %11, align 8
  %188 = getelementptr inbounds double, double* %187, i64 9
  %189 = load double, double* %188, align 8
  %190 = fmul double %186, %189
  %191 = load double, double* %17, align 8
  %192 = fsub double %191, %190
  store double %192, double* %17, align 8
  %193 = load double*, double** %16, align 8
  %194 = getelementptr inbounds double, double* %193, i64 10
  %195 = load double, double* %194, align 8
  %196 = load double*, double** %11, align 8
  %197 = getelementptr inbounds double, double* %196, i64 10
  %198 = load double, double* %197, align 8
  %199 = fmul double %195, %198
  %200 = load double, double* %17, align 8
  %201 = fadd double %200, %199
  store double %201, double* %17, align 8
  %202 = load double*, double** %16, align 8
  %203 = getelementptr inbounds double, double* %202, i64 11
  %204 = load double, double* %203, align 8
  %205 = load double*, double** %11, align 8
  %206 = getelementptr inbounds double, double* %205, i64 11
  %207 = load double, double* %206, align 8
  %208 = fmul double %204, %207
  %209 = load double, double* %17, align 8
  %210 = fsub double %209, %208
  store double %210, double* %17, align 8
  %211 = load double*, double** %16, align 8
  %212 = getelementptr inbounds double, double* %211, i64 12
  %213 = load double, double* %212, align 8
  %214 = load double*, double** %11, align 8
  %215 = getelementptr inbounds double, double* %214, i64 12
  %216 = load double, double* %215, align 8
  %217 = fmul double %213, %216
  %218 = load double, double* %17, align 8
  %219 = fadd double %218, %217
  store double %219, double* %17, align 8
  %220 = load double*, double** %16, align 8
  %221 = getelementptr inbounds double, double* %220, i64 13
  %222 = load double, double* %221, align 8
  %223 = load double*, double** %11, align 8
  %224 = getelementptr inbounds double, double* %223, i64 13
  %225 = load double, double* %224, align 8
  %226 = fmul double %222, %225
  %227 = load double, double* %17, align 8
  %228 = fsub double %227, %226
  store double %228, double* %17, align 8
  %229 = load double*, double** %16, align 8
  %230 = getelementptr inbounds double, double* %229, i64 14
  %231 = load double, double* %230, align 8
  %232 = load double*, double** %11, align 8
  %233 = getelementptr inbounds double, double* %232, i64 14
  %234 = load double, double* %233, align 8
  %235 = fmul double %231, %234
  %236 = load double, double* %17, align 8
  %237 = fadd double %236, %235
  store double %237, double* %17, align 8
  %238 = load double*, double** %16, align 8
  %239 = getelementptr inbounds double, double* %238, i64 15
  %240 = load double, double* %239, align 8
  %241 = load double*, double** %11, align 8
  %242 = getelementptr inbounds double, double* %241, i64 15
  %243 = load double, double* %242, align 8
  %244 = fmul double %240, %243
  %245 = load double, double* %17, align 8
  %246 = fsub double %245, %244
  store double %246, double* %17, align 8
  %247 = load double, double* %17, align 8
  %248 = fcmp ogt double %247, 3.276700e+04
  br i1 %248, label %249, label %254

; <label>:249:                                    ; preds = %104
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 0)
  %250 = add i64 %pgocount2, 1
  store i64 %250, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 0)
  %251 = load i16*, i16** %10, align 8
  store i16 32767, i16* %251, align 2
  %252 = load i32, i32* %13, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* %13, align 4
  br label %268

; <label>:254:                                    ; preds = %104
  %255 = load double, double* %17, align 8
  %256 = fcmp olt double %255, -3.276800e+04
  br i1 %256, label %257, label %262

; <label>:257:                                    ; preds = %254
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 2)
  %258 = add i64 %pgocount3, 1
  store i64 %258, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 2)
  %259 = load i16*, i16** %10, align 8
  store i16 -32768, i16* %259, align 2
  %260 = load i32, i32* %13, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %13, align 4
  br label %267

; <label>:262:                                    ; preds = %254
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 3)
  %263 = add i64 %pgocount4, 1
  store i64 %263, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 3)
  %264 = load double, double* %17, align 8
  %265 = fptosi double %264 to i16
  %266 = load i16*, i16** %10, align 8
  store i16 %265, i16* %266, align 2
  br label %267

; <label>:267:                                    ; preds = %262, %257
  br label %268

; <label>:268:                                    ; preds = %267, %249
  br label %269

; <label>:269:                                    ; preds = %268
  %270 = load i32, i32* %15, align 4
  %271 = add nsw i32 %270, -1
  store i32 %271, i32* %15, align 4
  %272 = load double*, double** %11, align 8
  %273 = getelementptr inbounds double, double* %272, i64 16
  store double* %273, double** %11, align 8
  %274 = load double*, double** %16, align 8
  %275 = getelementptr inbounds double, double* %274, i64 32
  store double* %275, double** %16, align 8
  %276 = load i16*, i16** %10, align 8
  %277 = getelementptr inbounds i16, i16* %276, i64 2
  store i16* %277, i16** %10, align 8
  br label %101

; <label>:278:                                    ; preds = %101
  %279 = load double*, double** %16, align 8
  %280 = getelementptr inbounds double, double* %279, i64 0
  %281 = load double, double* %280, align 8
  %282 = load double*, double** %11, align 8
  %283 = getelementptr inbounds double, double* %282, i64 0
  %284 = load double, double* %283, align 8
  %285 = fmul double %281, %284
  store double %285, double* %18, align 8
  %286 = load double*, double** %16, align 8
  %287 = getelementptr inbounds double, double* %286, i64 2
  %288 = load double, double* %287, align 8
  %289 = load double*, double** %11, align 8
  %290 = getelementptr inbounds double, double* %289, i64 2
  %291 = load double, double* %290, align 8
  %292 = fmul double %288, %291
  %293 = load double, double* %18, align 8
  %294 = fadd double %293, %292
  store double %294, double* %18, align 8
  %295 = load double*, double** %16, align 8
  %296 = getelementptr inbounds double, double* %295, i64 4
  %297 = load double, double* %296, align 8
  %298 = load double*, double** %11, align 8
  %299 = getelementptr inbounds double, double* %298, i64 4
  %300 = load double, double* %299, align 8
  %301 = fmul double %297, %300
  %302 = load double, double* %18, align 8
  %303 = fadd double %302, %301
  store double %303, double* %18, align 8
  %304 = load double*, double** %16, align 8
  %305 = getelementptr inbounds double, double* %304, i64 6
  %306 = load double, double* %305, align 8
  %307 = load double*, double** %11, align 8
  %308 = getelementptr inbounds double, double* %307, i64 6
  %309 = load double, double* %308, align 8
  %310 = fmul double %306, %309
  %311 = load double, double* %18, align 8
  %312 = fadd double %311, %310
  store double %312, double* %18, align 8
  %313 = load double*, double** %16, align 8
  %314 = getelementptr inbounds double, double* %313, i64 8
  %315 = load double, double* %314, align 8
  %316 = load double*, double** %11, align 8
  %317 = getelementptr inbounds double, double* %316, i64 8
  %318 = load double, double* %317, align 8
  %319 = fmul double %315, %318
  %320 = load double, double* %18, align 8
  %321 = fadd double %320, %319
  store double %321, double* %18, align 8
  %322 = load double*, double** %16, align 8
  %323 = getelementptr inbounds double, double* %322, i64 10
  %324 = load double, double* %323, align 8
  %325 = load double*, double** %11, align 8
  %326 = getelementptr inbounds double, double* %325, i64 10
  %327 = load double, double* %326, align 8
  %328 = fmul double %324, %327
  %329 = load double, double* %18, align 8
  %330 = fadd double %329, %328
  store double %330, double* %18, align 8
  %331 = load double*, double** %16, align 8
  %332 = getelementptr inbounds double, double* %331, i64 12
  %333 = load double, double* %332, align 8
  %334 = load double*, double** %11, align 8
  %335 = getelementptr inbounds double, double* %334, i64 12
  %336 = load double, double* %335, align 8
  %337 = fmul double %333, %336
  %338 = load double, double* %18, align 8
  %339 = fadd double %338, %337
  store double %339, double* %18, align 8
  %340 = load double*, double** %16, align 8
  %341 = getelementptr inbounds double, double* %340, i64 14
  %342 = load double, double* %341, align 8
  %343 = load double*, double** %11, align 8
  %344 = getelementptr inbounds double, double* %343, i64 14
  %345 = load double, double* %344, align 8
  %346 = fmul double %342, %345
  %347 = load double, double* %18, align 8
  %348 = fadd double %347, %346
  store double %348, double* %18, align 8
  %349 = load double, double* %18, align 8
  %350 = fcmp ogt double %349, 3.276700e+04
  br i1 %350, label %351, label %356

; <label>:351:                                    ; preds = %278
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 7)
  %352 = add i64 %pgocount5, 1
  store i64 %352, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 7)
  %353 = load i16*, i16** %10, align 8
  store i16 32767, i16* %353, align 2
  %354 = load i32, i32* %13, align 4
  %355 = add nsw i32 %354, 1
  store i32 %355, i32* %13, align 4
  br label %370

; <label>:356:                                    ; preds = %278
  %357 = load double, double* %18, align 8
  %358 = fcmp olt double %357, -3.276800e+04
  br i1 %358, label %359, label %364

; <label>:359:                                    ; preds = %356
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 9)
  %360 = add i64 %pgocount6, 1
  store i64 %360, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 9)
  %361 = load i16*, i16** %10, align 8
  store i16 -32768, i16* %361, align 2
  %362 = load i32, i32* %13, align 4
  %363 = add nsw i32 %362, 1
  store i32 %363, i32* %13, align 4
  br label %369

; <label>:364:                                    ; preds = %356
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 10)
  %365 = add i64 %pgocount7, 1
  store i64 %365, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 10)
  %366 = load double, double* %18, align 8
  %367 = fptosi double %366 to i16
  %368 = load i16*, i16** %10, align 8
  store i16 %367, i16* %368, align 2
  br label %369

; <label>:369:                                    ; preds = %364, %359
  br label %370

; <label>:370:                                    ; preds = %369, %351
  %371 = load double*, double** %11, align 8
  %372 = getelementptr inbounds double, double* %371, i64 -16
  store double* %372, double** %11, align 8
  %373 = load double*, double** %16, align 8
  %374 = getelementptr inbounds double, double* %373, i64 -32
  store double* %374, double** %16, align 8
  %375 = load i16*, i16** %10, align 8
  %376 = getelementptr inbounds i16, i16* %375, i64 2
  store i16* %376, i16** %10, align 8
  %377 = load i32, i32* %14, align 4
  %378 = shl i32 %377, 1
  %379 = load double*, double** %16, align 8
  %380 = sext i32 %378 to i64
  %381 = getelementptr inbounds double, double* %379, i64 %380
  store double* %381, double** %16, align 8
  store i32 15, i32* %15, align 4
  br label %382

; <label>:382:                                    ; preds = %551, %370
  %383 = load i32, i32* %15, align 4
  %384 = icmp ne i32 %383, 0
  br i1 %384, label %385, label %560

; <label>:385:                                    ; preds = %382
  %386 = load double*, double** %16, align 8
  %387 = getelementptr inbounds double, double* %386, i64 -1
  %388 = load double, double* %387, align 8
  %389 = fsub double -0.000000e+00, %388
  %390 = load double*, double** %11, align 8
  %391 = getelementptr inbounds double, double* %390, i64 0
  %392 = load double, double* %391, align 8
  %393 = fmul double %389, %392
  store double %393, double* %19, align 8
  %394 = load double*, double** %16, align 8
  %395 = getelementptr inbounds double, double* %394, i64 -2
  %396 = load double, double* %395, align 8
  %397 = load double*, double** %11, align 8
  %398 = getelementptr inbounds double, double* %397, i64 1
  %399 = load double, double* %398, align 8
  %400 = fmul double %396, %399
  %401 = load double, double* %19, align 8
  %402 = fsub double %401, %400
  store double %402, double* %19, align 8
  %403 = load double*, double** %16, align 8
  %404 = getelementptr inbounds double, double* %403, i64 -3
  %405 = load double, double* %404, align 8
  %406 = load double*, double** %11, align 8
  %407 = getelementptr inbounds double, double* %406, i64 2
  %408 = load double, double* %407, align 8
  %409 = fmul double %405, %408
  %410 = load double, double* %19, align 8
  %411 = fsub double %410, %409
  store double %411, double* %19, align 8
  %412 = load double*, double** %16, align 8
  %413 = getelementptr inbounds double, double* %412, i64 -4
  %414 = load double, double* %413, align 8
  %415 = load double*, double** %11, align 8
  %416 = getelementptr inbounds double, double* %415, i64 3
  %417 = load double, double* %416, align 8
  %418 = fmul double %414, %417
  %419 = load double, double* %19, align 8
  %420 = fsub double %419, %418
  store double %420, double* %19, align 8
  %421 = load double*, double** %16, align 8
  %422 = getelementptr inbounds double, double* %421, i64 -5
  %423 = load double, double* %422, align 8
  %424 = load double*, double** %11, align 8
  %425 = getelementptr inbounds double, double* %424, i64 4
  %426 = load double, double* %425, align 8
  %427 = fmul double %423, %426
  %428 = load double, double* %19, align 8
  %429 = fsub double %428, %427
  store double %429, double* %19, align 8
  %430 = load double*, double** %16, align 8
  %431 = getelementptr inbounds double, double* %430, i64 -6
  %432 = load double, double* %431, align 8
  %433 = load double*, double** %11, align 8
  %434 = getelementptr inbounds double, double* %433, i64 5
  %435 = load double, double* %434, align 8
  %436 = fmul double %432, %435
  %437 = load double, double* %19, align 8
  %438 = fsub double %437, %436
  store double %438, double* %19, align 8
  %439 = load double*, double** %16, align 8
  %440 = getelementptr inbounds double, double* %439, i64 -7
  %441 = load double, double* %440, align 8
  %442 = load double*, double** %11, align 8
  %443 = getelementptr inbounds double, double* %442, i64 6
  %444 = load double, double* %443, align 8
  %445 = fmul double %441, %444
  %446 = load double, double* %19, align 8
  %447 = fsub double %446, %445
  store double %447, double* %19, align 8
  %448 = load double*, double** %16, align 8
  %449 = getelementptr inbounds double, double* %448, i64 -8
  %450 = load double, double* %449, align 8
  %451 = load double*, double** %11, align 8
  %452 = getelementptr inbounds double, double* %451, i64 7
  %453 = load double, double* %452, align 8
  %454 = fmul double %450, %453
  %455 = load double, double* %19, align 8
  %456 = fsub double %455, %454
  store double %456, double* %19, align 8
  %457 = load double*, double** %16, align 8
  %458 = getelementptr inbounds double, double* %457, i64 -9
  %459 = load double, double* %458, align 8
  %460 = load double*, double** %11, align 8
  %461 = getelementptr inbounds double, double* %460, i64 8
  %462 = load double, double* %461, align 8
  %463 = fmul double %459, %462
  %464 = load double, double* %19, align 8
  %465 = fsub double %464, %463
  store double %465, double* %19, align 8
  %466 = load double*, double** %16, align 8
  %467 = getelementptr inbounds double, double* %466, i64 -10
  %468 = load double, double* %467, align 8
  %469 = load double*, double** %11, align 8
  %470 = getelementptr inbounds double, double* %469, i64 9
  %471 = load double, double* %470, align 8
  %472 = fmul double %468, %471
  %473 = load double, double* %19, align 8
  %474 = fsub double %473, %472
  store double %474, double* %19, align 8
  %475 = load double*, double** %16, align 8
  %476 = getelementptr inbounds double, double* %475, i64 -11
  %477 = load double, double* %476, align 8
  %478 = load double*, double** %11, align 8
  %479 = getelementptr inbounds double, double* %478, i64 10
  %480 = load double, double* %479, align 8
  %481 = fmul double %477, %480
  %482 = load double, double* %19, align 8
  %483 = fsub double %482, %481
  store double %483, double* %19, align 8
  %484 = load double*, double** %16, align 8
  %485 = getelementptr inbounds double, double* %484, i64 -12
  %486 = load double, double* %485, align 8
  %487 = load double*, double** %11, align 8
  %488 = getelementptr inbounds double, double* %487, i64 11
  %489 = load double, double* %488, align 8
  %490 = fmul double %486, %489
  %491 = load double, double* %19, align 8
  %492 = fsub double %491, %490
  store double %492, double* %19, align 8
  %493 = load double*, double** %16, align 8
  %494 = getelementptr inbounds double, double* %493, i64 -13
  %495 = load double, double* %494, align 8
  %496 = load double*, double** %11, align 8
  %497 = getelementptr inbounds double, double* %496, i64 12
  %498 = load double, double* %497, align 8
  %499 = fmul double %495, %498
  %500 = load double, double* %19, align 8
  %501 = fsub double %500, %499
  store double %501, double* %19, align 8
  %502 = load double*, double** %16, align 8
  %503 = getelementptr inbounds double, double* %502, i64 -14
  %504 = load double, double* %503, align 8
  %505 = load double*, double** %11, align 8
  %506 = getelementptr inbounds double, double* %505, i64 13
  %507 = load double, double* %506, align 8
  %508 = fmul double %504, %507
  %509 = load double, double* %19, align 8
  %510 = fsub double %509, %508
  store double %510, double* %19, align 8
  %511 = load double*, double** %16, align 8
  %512 = getelementptr inbounds double, double* %511, i64 -15
  %513 = load double, double* %512, align 8
  %514 = load double*, double** %11, align 8
  %515 = getelementptr inbounds double, double* %514, i64 14
  %516 = load double, double* %515, align 8
  %517 = fmul double %513, %516
  %518 = load double, double* %19, align 8
  %519 = fsub double %518, %517
  store double %519, double* %19, align 8
  %520 = load double*, double** %16, align 8
  %521 = getelementptr inbounds double, double* %520, i64 0
  %522 = load double, double* %521, align 8
  %523 = load double*, double** %11, align 8
  %524 = getelementptr inbounds double, double* %523, i64 15
  %525 = load double, double* %524, align 8
  %526 = fmul double %522, %525
  %527 = load double, double* %19, align 8
  %528 = fsub double %527, %526
  store double %528, double* %19, align 8
  %529 = load double, double* %19, align 8
  %530 = fcmp ogt double %529, 3.276700e+04
  br i1 %530, label %531, label %536

; <label>:531:                                    ; preds = %385
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 1)
  %532 = add i64 %pgocount8, 1
  store i64 %532, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 1)
  %533 = load i16*, i16** %10, align 8
  store i16 32767, i16* %533, align 2
  %534 = load i32, i32* %13, align 4
  %535 = add nsw i32 %534, 1
  store i32 %535, i32* %13, align 4
  br label %550

; <label>:536:                                    ; preds = %385
  %537 = load double, double* %19, align 8
  %538 = fcmp olt double %537, -3.276800e+04
  br i1 %538, label %539, label %544

; <label>:539:                                    ; preds = %536
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 4)
  %540 = add i64 %pgocount9, 1
  store i64 %540, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 4)
  %541 = load i16*, i16** %10, align 8
  store i16 -32768, i16* %541, align 2
  %542 = load i32, i32* %13, align 4
  %543 = add nsw i32 %542, 1
  store i32 %543, i32* %13, align 4
  br label %549

; <label>:544:                                    ; preds = %536
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 5)
  %545 = add i64 %pgocount10, 1
  store i64 %545, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_synth_1to1, i64 0, i64 5)
  %546 = load double, double* %19, align 8
  %547 = fptosi double %546 to i16
  %548 = load i16*, i16** %10, align 8
  store i16 %547, i16* %548, align 2
  br label %549

; <label>:549:                                    ; preds = %544, %539
  br label %550

; <label>:550:                                    ; preds = %549, %531
  br label %551

; <label>:551:                                    ; preds = %550
  %552 = load i32, i32* %15, align 4
  %553 = add nsw i32 %552, -1
  store i32 %553, i32* %15, align 4
  %554 = load double*, double** %11, align 8
  %555 = getelementptr inbounds double, double* %554, i64 -16
  store double* %555, double** %11, align 8
  %556 = load double*, double** %16, align 8
  %557 = getelementptr inbounds double, double* %556, i64 -32
  store double* %557, double** %16, align 8
  %558 = load i16*, i16** %10, align 8
  %559 = getelementptr inbounds i16, i16* %558, i64 2
  store i16* %559, i16** %10, align 8
  br label %382

; <label>:560:                                    ; preds = %382
  %561 = load i32*, i32** %8, align 8
  %562 = load i32, i32* %561, align 4
  %563 = add nsw i32 %562, 128
  store i32 %563, i32* %561, align 4
  %564 = load i32, i32* %13, align 4
  ret i32 %564
}

declare void @dct64(double*, double*, double*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
