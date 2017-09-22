; ModuleID = 'ludcmp.c'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca [2000 x [2000 x double]]*, align 8
  %8 = alloca [2000 x double]*, align 8
  %9 = alloca [2000 x double]*, align 8
  %10 = alloca [2000 x double]*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 2000, i32* %6, align 4
  %11 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %12 = bitcast i8* %11 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %12, [2000 x [2000 x double]]** %7, align 8
  %13 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %14 = bitcast i8* %13 to [2000 x double]*
  store [2000 x double]* %14, [2000 x double]** %8, align 8
  %15 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %16 = bitcast i8* %15 to [2000 x double]*
  store [2000 x double]* %16, [2000 x double]** %9, align 8
  %17 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %18 = bitcast i8* %17 to [2000 x double]*
  store [2000 x double]* %18, [2000 x double]** %10, align 8
  %19 = load i32, i32* %6, align 4
  %20 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %21 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i32 0, i32 0
  %22 = load [2000 x double]*, [2000 x double]** %8, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i32 0, i32 0
  %24 = load [2000 x double]*, [2000 x double]** %9, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %24, i32 0, i32 0
  %26 = load [2000 x double]*, [2000 x double]** %10, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i32 0, i32 0
  call void @init_array(i32 %19, [2000 x double]* %21, double* %23, double* %25, double* %27)
  call void (...) @polybench_timer_start()
  %28 = load i32, i32* %6, align 4
  %29 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %30 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i32 0, i32 0
  %31 = load [2000 x double]*, [2000 x double]** %8, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i32 0, i32 0
  %33 = load [2000 x double]*, [2000 x double]** %9, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %33, i32 0, i32 0
  %35 = load [2000 x double]*, [2000 x double]** %10, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %35, i32 0, i32 0
  call void @kernel_ludcmp(i32 %28, [2000 x double]* %30, double* %32, double* %34, double* %36)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %37 = load i32, i32* %4, align 4
  %38 = icmp sgt i32 %37, 42
  br i1 %38, label %39, label %49

; <label>:39:                                     ; preds = %2
  %40 = load i8**, i8*** %5, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 0
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %49, label %45

; <label>:45:                                     ; preds = %39
  %46 = load i32, i32* %6, align 4
  %47 = load [2000 x double]*, [2000 x double]** %9, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %47, i32 0, i32 0
  call void @print_array(i32 %46, double* %48)
  br label %49

; <label>:49:                                     ; preds = %45, %39, %2
  %50 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %7, align 8
  %51 = bitcast [2000 x [2000 x double]]* %50 to i8*
  call void @free(i8* %51) #5
  %52 = load [2000 x double]*, [2000 x double]** %8, align 8
  %53 = bitcast [2000 x double]* %52 to i8*
  call void @free(i8* %53) #5
  %54 = load [2000 x double]*, [2000 x double]** %9, align 8
  %55 = bitcast [2000 x double]* %54 to i8*
  call void @free(i8* %55) #5
  %56 = load [2000 x double]*, [2000 x double]** %10, align 8
  %57 = bitcast [2000 x double]* %56 to i8*
  call void @free(i8* %57) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*, double*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  store double* %2, double** %8, align 8
  store double* %3, double** %9, align 8
  store double* %4, double** %10, align 8
  %18 = load i32, i32* %6, align 4
  %19 = sitofp i32 %18 to double
  store double %19, double* %13, align 8
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %44, %5
  %21 = load i32, i32* %11, align 4
  %22 = load i32, i32* %6, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %20
  %25 = load double*, double** %9, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double* %25, i64 %27
  store double 0.000000e+00, double* %28, align 8
  %29 = load double*, double** %10, align 8
  %30 = load i32, i32* %11, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, double* %29, i64 %31
  store double 0.000000e+00, double* %32, align 8
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  %35 = sitofp i32 %34 to double
  %36 = load double, double* %13, align 8
  %37 = fdiv double %35, %36
  %38 = fdiv double %37, 2.000000e+00
  %39 = fadd double %38, 4.000000e+00
  %40 = load double*, double** %8, align 8
  %41 = load i32, i32* %11, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double* %40, i64 %42
  store double %39, double* %43, align 8
  br label %44

; <label>:44:                                     ; preds = %24
  %45 = load i32, i32* %11, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %11, align 4
  br label %20

; <label>:47:                                     ; preds = %20
  store i32 0, i32* %11, align 4
  br label %48

; <label>:48:                                     ; preds = %103, %47
  %49 = load i32, i32* %11, align 4
  %50 = load i32, i32* %6, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %106

; <label>:52:                                     ; preds = %48
  store i32 0, i32* %12, align 4
  br label %53

; <label>:53:                                     ; preds = %74, %52
  %54 = load i32, i32* %12, align 4
  %55 = load i32, i32* %11, align 4
  %56 = icmp sle i32 %54, %55
  br i1 %56, label %57, label %77

; <label>:57:                                     ; preds = %53
  %58 = load i32, i32* %12, align 4
  %59 = sub nsw i32 0, %58
  %60 = load i32, i32* %6, align 4
  %61 = srem i32 %59, %60
  %62 = sitofp i32 %61 to double
  %63 = load i32, i32* %6, align 4
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %62, %64
  %66 = fadd double %65, 1.000000e+00
  %67 = load [2000 x double]*, [2000 x double]** %7, align 8
  %68 = load i32, i32* %11, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %69
  %71 = load i32, i32* %12, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 0, i64 %72
  store double %66, double* %73, align 8
  br label %74

; <label>:74:                                     ; preds = %57
  %75 = load i32, i32* %12, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %12, align 4
  br label %53

; <label>:77:                                     ; preds = %53
  %78 = load i32, i32* %11, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %12, align 4
  br label %80

; <label>:80:                                     ; preds = %92, %77
  %81 = load i32, i32* %12, align 4
  %82 = load i32, i32* %6, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %95

; <label>:84:                                     ; preds = %80
  %85 = load [2000 x double]*, [2000 x double]** %7, align 8
  %86 = load i32, i32* %11, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %85, i64 %87
  %89 = load i32, i32* %12, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %88, i64 0, i64 %90
  store double 0.000000e+00, double* %91, align 8
  br label %92

; <label>:92:                                     ; preds = %84
  %93 = load i32, i32* %12, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %12, align 4
  br label %80

; <label>:95:                                     ; preds = %80
  %96 = load [2000 x double]*, [2000 x double]** %7, align 8
  %97 = load i32, i32* %11, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %98
  %100 = load i32, i32* %11, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %99, i64 0, i64 %101
  store double 1.000000e+00, double* %102, align 8
  br label %103

; <label>:103:                                    ; preds = %95
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %11, align 4
  br label %48

; <label>:106:                                    ; preds = %48
  %107 = call i8* @polybench_alloc_data(i64 4000000, i32 8)
  %108 = bitcast i8* %107 to [2000 x [2000 x double]]*
  store [2000 x [2000 x double]]* %108, [2000 x [2000 x double]]** %17, align 8
  store i32 0, i32* %14, align 4
  br label %109

; <label>:109:                                    ; preds = %130, %106
  %110 = load i32, i32* %14, align 4
  %111 = load i32, i32* %6, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %133

; <label>:113:                                    ; preds = %109
  store i32 0, i32* %15, align 4
  br label %114

; <label>:114:                                    ; preds = %126, %113
  %115 = load i32, i32* %15, align 4
  %116 = load i32, i32* %6, align 4
  %117 = icmp slt i32 %115, %116
  br i1 %117, label %118, label %129

; <label>:118:                                    ; preds = %114
  %119 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %120 = load i32, i32* %14, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %119, i64 0, i64 %121
  %123 = load i32, i32* %15, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %122, i64 0, i64 %124
  store double 0.000000e+00, double* %125, align 8
  br label %126

; <label>:126:                                    ; preds = %118
  %127 = load i32, i32* %15, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %15, align 4
  br label %114

; <label>:129:                                    ; preds = %114
  br label %130

; <label>:130:                                    ; preds = %129
  %131 = load i32, i32* %14, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %14, align 4
  br label %109

; <label>:133:                                    ; preds = %109
  store i32 0, i32* %16, align 4
  br label %134

; <label>:134:                                    ; preds = %183, %133
  %135 = load i32, i32* %16, align 4
  %136 = load i32, i32* %6, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %186

; <label>:138:                                    ; preds = %134
  store i32 0, i32* %14, align 4
  br label %139

; <label>:139:                                    ; preds = %179, %138
  %140 = load i32, i32* %14, align 4
  %141 = load i32, i32* %6, align 4
  %142 = icmp slt i32 %140, %141
  br i1 %142, label %143, label %182

; <label>:143:                                    ; preds = %139
  store i32 0, i32* %15, align 4
  br label %144

; <label>:144:                                    ; preds = %175, %143
  %145 = load i32, i32* %15, align 4
  %146 = load i32, i32* %6, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %178

; <label>:148:                                    ; preds = %144
  %149 = load [2000 x double]*, [2000 x double]** %7, align 8
  %150 = load i32, i32* %14, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %149, i64 %151
  %153 = load i32, i32* %16, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %152, i64 0, i64 %154
  %156 = load double, double* %155, align 8
  %157 = load [2000 x double]*, [2000 x double]** %7, align 8
  %158 = load i32, i32* %15, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %157, i64 %159
  %161 = load i32, i32* %16, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 0, i64 %162
  %164 = load double, double* %163, align 8
  %165 = fmul double %156, %164
  %166 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %167 = load i32, i32* %14, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %166, i64 0, i64 %168
  %170 = load i32, i32* %15, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %169, i64 0, i64 %171
  %173 = load double, double* %172, align 8
  %174 = fadd double %173, %165
  store double %174, double* %172, align 8
  br label %175

; <label>:175:                                    ; preds = %148
  %176 = load i32, i32* %15, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* %15, align 4
  br label %144

; <label>:178:                                    ; preds = %144
  br label %179

; <label>:179:                                    ; preds = %178
  %180 = load i32, i32* %14, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %14, align 4
  br label %139

; <label>:182:                                    ; preds = %139
  br label %183

; <label>:183:                                    ; preds = %182
  %184 = load i32, i32* %16, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %16, align 4
  br label %134

; <label>:186:                                    ; preds = %134
  store i32 0, i32* %14, align 4
  br label %187

; <label>:187:                                    ; preds = %216, %186
  %188 = load i32, i32* %14, align 4
  %189 = load i32, i32* %6, align 4
  %190 = icmp slt i32 %188, %189
  br i1 %190, label %191, label %219

; <label>:191:                                    ; preds = %187
  store i32 0, i32* %15, align 4
  br label %192

; <label>:192:                                    ; preds = %212, %191
  %193 = load i32, i32* %15, align 4
  %194 = load i32, i32* %6, align 4
  %195 = icmp slt i32 %193, %194
  br i1 %195, label %196, label %215

; <label>:196:                                    ; preds = %192
  %197 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %198 = load i32, i32* %14, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %197, i64 0, i64 %199
  %201 = load i32, i32* %15, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [2000 x double], [2000 x double]* %200, i64 0, i64 %202
  %204 = load double, double* %203, align 8
  %205 = load [2000 x double]*, [2000 x double]** %7, align 8
  %206 = load i32, i32* %14, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %205, i64 %207
  %209 = load i32, i32* %15, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [2000 x double], [2000 x double]* %208, i64 0, i64 %210
  store double %204, double* %211, align 8
  br label %212

; <label>:212:                                    ; preds = %196
  %213 = load i32, i32* %15, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, i32* %15, align 4
  br label %192

; <label>:215:                                    ; preds = %192
  br label %216

; <label>:216:                                    ; preds = %215
  %217 = load i32, i32* %14, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %14, align 4
  br label %187

; <label>:219:                                    ; preds = %187
  %220 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %17, align 8
  %221 = bitcast [2000 x [2000 x double]]* %220 to i8*
  call void @free(i8* %221) #5
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  store double* %2, double** %8, align 8
  store double* %3, double** %9, align 8
  store double* %4, double** %10, align 8
  store i32 0, i32* %11, align 4
  br label %15

; <label>:15:                                     ; preds = %136, %5
  %16 = load i32, i32* %11, align 4
  %17 = load i32, i32* %6, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %139

; <label>:19:                                     ; preds = %15
  store i32 0, i32* %12, align 4
  br label %20

; <label>:20:                                     ; preds = %78, %19
  %21 = load i32, i32* %12, align 4
  %22 = load i32, i32* %11, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %81

; <label>:24:                                     ; preds = %20
  %25 = load [2000 x double]*, [2000 x double]** %7, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %27
  %29 = load i32, i32* %12, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %28, i64 0, i64 %30
  %32 = load double, double* %31, align 8
  store double %32, double* %14, align 8
  store i32 0, i32* %13, align 4
  br label %33

; <label>:33:                                     ; preds = %57, %24
  %34 = load i32, i32* %13, align 4
  %35 = load i32, i32* %12, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %60

; <label>:37:                                     ; preds = %33
  %38 = load [2000 x double]*, [2000 x double]** %7, align 8
  %39 = load i32, i32* %11, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %40
  %42 = load i32, i32* %13, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 0, i64 %43
  %45 = load double, double* %44, align 8
  %46 = load [2000 x double]*, [2000 x double]** %7, align 8
  %47 = load i32, i32* %13, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %48
  %50 = load i32, i32* %12, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 0, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fmul double %45, %53
  %55 = load double, double* %14, align 8
  %56 = fsub double %55, %54
  store double %56, double* %14, align 8
  br label %57

; <label>:57:                                     ; preds = %37
  %58 = load i32, i32* %13, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %13, align 4
  br label %33

; <label>:60:                                     ; preds = %33
  %61 = load double, double* %14, align 8
  %62 = load [2000 x double]*, [2000 x double]** %7, align 8
  %63 = load i32, i32* %12, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 %64
  %66 = load i32, i32* %12, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 0, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fdiv double %61, %69
  %71 = load [2000 x double]*, [2000 x double]** %7, align 8
  %72 = load i32, i32* %11, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %71, i64 %73
  %75 = load i32, i32* %12, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %74, i64 0, i64 %76
  store double %70, double* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %60
  %79 = load i32, i32* %12, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %12, align 4
  br label %20

; <label>:81:                                     ; preds = %20
  %82 = load i32, i32* %11, align 4
  store i32 %82, i32* %12, align 4
  br label %83

; <label>:83:                                     ; preds = %132, %81
  %84 = load i32, i32* %12, align 4
  %85 = load i32, i32* %6, align 4
  %86 = icmp slt i32 %84, %85
  br i1 %86, label %87, label %135

; <label>:87:                                     ; preds = %83
  %88 = load [2000 x double]*, [2000 x double]** %7, align 8
  %89 = load i32, i32* %11, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %88, i64 %90
  %92 = load i32, i32* %12, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %91, i64 0, i64 %93
  %95 = load double, double* %94, align 8
  store double %95, double* %14, align 8
  store i32 0, i32* %13, align 4
  br label %96

; <label>:96:                                     ; preds = %120, %87
  %97 = load i32, i32* %13, align 4
  %98 = load i32, i32* %11, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %123

; <label>:100:                                    ; preds = %96
  %101 = load [2000 x double]*, [2000 x double]** %7, align 8
  %102 = load i32, i32* %11, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %103
  %105 = load i32, i32* %13, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %104, i64 0, i64 %106
  %108 = load double, double* %107, align 8
  %109 = load [2000 x double]*, [2000 x double]** %7, align 8
  %110 = load i32, i32* %13, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %109, i64 %111
  %113 = load i32, i32* %12, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %112, i64 0, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fmul double %108, %116
  %118 = load double, double* %14, align 8
  %119 = fsub double %118, %117
  store double %119, double* %14, align 8
  br label %120

; <label>:120:                                    ; preds = %100
  %121 = load i32, i32* %13, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %13, align 4
  br label %96

; <label>:123:                                    ; preds = %96
  %124 = load double, double* %14, align 8
  %125 = load [2000 x double]*, [2000 x double]** %7, align 8
  %126 = load i32, i32* %11, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %125, i64 %127
  %129 = load i32, i32* %12, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 0, i64 %130
  store double %124, double* %131, align 8
  br label %132

; <label>:132:                                    ; preds = %123
  %133 = load i32, i32* %12, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %12, align 4
  br label %83

; <label>:135:                                    ; preds = %83
  br label %136

; <label>:136:                                    ; preds = %135
  %137 = load i32, i32* %11, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %11, align 4
  br label %15

; <label>:139:                                    ; preds = %15
  store i32 0, i32* %11, align 4
  br label %140

; <label>:140:                                    ; preds = %180, %139
  %141 = load i32, i32* %11, align 4
  %142 = load i32, i32* %6, align 4
  %143 = icmp slt i32 %141, %142
  br i1 %143, label %144, label %183

; <label>:144:                                    ; preds = %140
  %145 = load double*, double** %8, align 8
  %146 = load i32, i32* %11, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds double, double* %145, i64 %147
  %149 = load double, double* %148, align 8
  store double %149, double* %14, align 8
  store i32 0, i32* %12, align 4
  br label %150

; <label>:150:                                    ; preds = %171, %144
  %151 = load i32, i32* %12, align 4
  %152 = load i32, i32* %11, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %174

; <label>:154:                                    ; preds = %150
  %155 = load [2000 x double]*, [2000 x double]** %7, align 8
  %156 = load i32, i32* %11, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %155, i64 %157
  %159 = load i32, i32* %12, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %158, i64 0, i64 %160
  %162 = load double, double* %161, align 8
  %163 = load double*, double** %10, align 8
  %164 = load i32, i32* %12, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds double, double* %163, i64 %165
  %167 = load double, double* %166, align 8
  %168 = fmul double %162, %167
  %169 = load double, double* %14, align 8
  %170 = fsub double %169, %168
  store double %170, double* %14, align 8
  br label %171

; <label>:171:                                    ; preds = %154
  %172 = load i32, i32* %12, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %12, align 4
  br label %150

; <label>:174:                                    ; preds = %150
  %175 = load double, double* %14, align 8
  %176 = load double*, double** %10, align 8
  %177 = load i32, i32* %11, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds double, double* %176, i64 %178
  store double %175, double* %179, align 8
  br label %180

; <label>:180:                                    ; preds = %174
  %181 = load i32, i32* %11, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %11, align 4
  br label %140

; <label>:183:                                    ; preds = %140
  %184 = load i32, i32* %6, align 4
  %185 = sub nsw i32 %184, 1
  store i32 %185, i32* %11, align 4
  br label %186

; <label>:186:                                    ; preds = %236, %183
  %187 = load i32, i32* %11, align 4
  %188 = icmp sge i32 %187, 0
  br i1 %188, label %189, label %239

; <label>:189:                                    ; preds = %186
  %190 = load double*, double** %10, align 8
  %191 = load i32, i32* %11, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds double, double* %190, i64 %192
  %194 = load double, double* %193, align 8
  store double %194, double* %14, align 8
  %195 = load i32, i32* %11, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %12, align 4
  br label %197

; <label>:197:                                    ; preds = %218, %189
  %198 = load i32, i32* %12, align 4
  %199 = load i32, i32* %6, align 4
  %200 = icmp slt i32 %198, %199
  br i1 %200, label %201, label %221

; <label>:201:                                    ; preds = %197
  %202 = load [2000 x double]*, [2000 x double]** %7, align 8
  %203 = load i32, i32* %11, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [2000 x double], [2000 x double]* %202, i64 %204
  %206 = load i32, i32* %12, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %205, i64 0, i64 %207
  %209 = load double, double* %208, align 8
  %210 = load double*, double** %9, align 8
  %211 = load i32, i32* %12, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds double, double* %210, i64 %212
  %214 = load double, double* %213, align 8
  %215 = fmul double %209, %214
  %216 = load double, double* %14, align 8
  %217 = fsub double %216, %215
  store double %217, double* %14, align 8
  br label %218

; <label>:218:                                    ; preds = %201
  %219 = load i32, i32* %12, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %12, align 4
  br label %197

; <label>:221:                                    ; preds = %197
  %222 = load double, double* %14, align 8
  %223 = load [2000 x double]*, [2000 x double]** %7, align 8
  %224 = load i32, i32* %11, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [2000 x double], [2000 x double]* %223, i64 %225
  %227 = load i32, i32* %11, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [2000 x double], [2000 x double]* %226, i64 0, i64 %228
  %230 = load double, double* %229, align 8
  %231 = fdiv double %222, %230
  %232 = load double*, double** %9, align 8
  %233 = load i32, i32* %11, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds double, double* %232, i64 %234
  store double %231, double* %235, align 8
  br label %236

; <label>:236:                                    ; preds = %221
  %237 = load i32, i32* %11, align 4
  %238 = add nsw i32 %237, -1
  store i32 %238, i32* %11, align 4
  br label %186

; <label>:239:                                    ; preds = %186
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %29, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %3, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %32

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %5, align 4
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %14
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %21

; <label>:21:                                     ; preds = %18, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = load double*, double** %4, align 8
  %24 = load i32, i32* %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double* %23, i64 %25
  %27 = load double, double* %26, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %27)
  br label %29

; <label>:29:                                     ; preds = %21
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %5, align 4
  br label %10

; <label>:32:                                     ; preds = %10
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
