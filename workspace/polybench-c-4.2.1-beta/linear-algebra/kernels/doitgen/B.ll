; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %178

; <label>:8:                                      ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %11 = zext i32 %2 to i64
  %12 = zext i32 %2 to i64
  %13 = zext i32 %1 to i64
  %14 = zext i32 %1 to i64
  %15 = zext i32 %0 to i64
  %16 = getelementptr double, double* %5, i64 %12
  %17 = add nsw i64 %14, -1
  %18 = add nsw i64 %11, -1
  %19 = and i64 %11, 1
  %20 = icmp eq i64 %19, 0
  %21 = icmp eq i32 %2, 1
  %22 = icmp ult i32 %2, 4
  %23 = and i32 %2, 3
  %24 = zext i32 %23 to i64
  %25 = sub nsw i64 %12, %24
  %26 = icmp eq i64 %25, 0
  %27 = icmp eq i32 %23, 0
  %28 = and i64 %14, 7
  %29 = icmp eq i64 %28, 0
  %30 = icmp ult i64 %17, 7
  br label %31

; <label>:31:                                     ; preds = %174, %8
  %32 = phi i64 [ 0, %8 ], [ %175, %174 ]
  br i1 %9, label %33, label %174

; <label>:33:                                     ; preds = %31
  br i1 %10, label %46, label %34

; <label>:34:                                     ; preds = %33
  br i1 %29, label %43, label %35

; <label>:35:                                     ; preds = %34
  br label %36

; <label>:36:                                     ; preds = %36, %35
  %37 = phi i64 [ %39, %36 ], [ 0, %35 ]
  %38 = phi i64 [ %40, %36 ], [ %28, %35 ]
  %39 = add nuw nsw i64 %37, 1
  %40 = add i64 %38, -1
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %36, !llvm.loop !1

; <label>:42:                                     ; preds = %36
  br label %43

; <label>:43:                                     ; preds = %42, %34
  %44 = phi i64 [ 0, %34 ], [ %39, %42 ]
  br i1 %30, label %173, label %45

; <label>:45:                                     ; preds = %43
  br label %167

; <label>:46:                                     ; preds = %33
  br label %47

; <label>:47:                                     ; preds = %54, %46
  %48 = phi i64 [ %55, %54 ], [ 0, %46 ]
  %49 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 0
  %50 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %12
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 0
  br label %84

; <label>:52:                                     ; preds = %57
  br label %53

; <label>:53:                                     ; preds = %124, %52
  br label %54

; <label>:54:                                     ; preds = %148, %53
  %55 = add nuw nsw i64 %48, 1
  %56 = icmp eq i64 %55, %13
  br i1 %56, label %171, label %47

; <label>:57:                                     ; preds = %127, %57
  %58 = phi i64 [ %125, %127 ], [ %82, %57 ]
  %59 = getelementptr inbounds double, double* %5, i64 %58
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8, !tbaa !3
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %58
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8, !tbaa !3
  %64 = add nuw nsw i64 %58, 1
  %65 = getelementptr inbounds double, double* %5, i64 %64
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8, !tbaa !3
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %64
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8, !tbaa !3
  %70 = add nsw i64 %58, 2
  %71 = getelementptr inbounds double, double* %5, i64 %70
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8, !tbaa !3
  %74 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %70
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8, !tbaa !3
  %76 = add nsw i64 %58, 3
  %77 = getelementptr inbounds double, double* %5, i64 %76
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8, !tbaa !3
  %80 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %76
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8, !tbaa !3
  %82 = add nsw i64 %58, 4
  %83 = icmp eq i64 %82, %12
  br i1 %83, label %52, label %57, !llvm.loop !7

; <label>:84:                                     ; preds = %100, %47
  %85 = phi i64 [ 0, %47 ], [ %102, %100 ]
  %86 = getelementptr inbounds double, double* %5, i64 %85
  store double 0.000000e+00, double* %86, align 8, !tbaa !3
  br i1 %20, label %94, label %87

; <label>:87:                                     ; preds = %84
  br label %88

; <label>:88:                                     ; preds = %87
  %89 = load double, double* %51, align 8, !tbaa !3
  %90 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %85
  %91 = load double, double* %90, align 8, !tbaa !3
  %92 = fmul double %89, %91
  %93 = fadd double %92, 0.000000e+00
  store double %93, double* %86, align 8, !tbaa !3
  br label %94

; <label>:94:                                     ; preds = %88, %84
  %95 = phi double [ %93, %88 ], [ 0.000000e+00, %84 ]
  %96 = phi i64 [ 1, %88 ], [ 0, %84 ]
  br label %97

; <label>:97:                                     ; preds = %94
  br i1 %21, label %100, label %98

; <label>:98:                                     ; preds = %97
  br label %149

; <label>:99:                                     ; preds = %149
  br label %100

; <label>:100:                                    ; preds = %99, %97
  %101 = phi i64 [ 1, %97 ], [ %165, %99 ]
  %102 = add nuw nsw i64 %85, 1
  %103 = icmp eq i64 %102, %101
  br i1 %103, label %104, label %84

; <label>:104:                                    ; preds = %100
  br i1 %22, label %105, label %128

; <label>:105:                                    ; preds = %148, %129, %128, %104
  %106 = phi i64 [ 0, %129 ], [ 0, %128 ], [ 0, %104 ], [ %25, %148 ]
  %107 = sub nsw i64 %11, %106
  %108 = sub nsw i64 %18, %106
  %109 = and i64 %107, 3
  %110 = icmp eq i64 %109, 0
  br i1 %110, label %124, label %111

; <label>:111:                                    ; preds = %105
  br label %112

; <label>:112:                                    ; preds = %112, %111
  %113 = phi i64 [ %120, %112 ], [ %106, %111 ]
  %114 = phi i64 [ %121, %112 ], [ %109, %111 ]
  %115 = getelementptr inbounds double, double* %5, i64 %113
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8, !tbaa !3
  %118 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %113
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8, !tbaa !3
  %120 = add nuw nsw i64 %113, 1
  %121 = add i64 %114, -1
  %122 = icmp eq i64 %121, 0
  br i1 %122, label %123, label %112, !llvm.loop !10

; <label>:123:                                    ; preds = %112
  br label %124

; <label>:124:                                    ; preds = %123, %105
  %125 = phi i64 [ %106, %105 ], [ %120, %123 ]
  %126 = icmp ult i64 %108, 3
  br i1 %126, label %53, label %127

; <label>:127:                                    ; preds = %124
  br label %57

; <label>:128:                                    ; preds = %104
  br i1 %26, label %105, label %129

; <label>:129:                                    ; preds = %128
  %130 = icmp ult double* %49, %16
  %131 = icmp ugt double* %50, %5
  %132 = and i1 %130, %131
  br i1 %132, label %105, label %133

; <label>:133:                                    ; preds = %129
  br label %134

; <label>:134:                                    ; preds = %134, %133
  %135 = phi i64 [ %146, %134 ], [ 0, %133 ]
  %136 = getelementptr inbounds double, double* %5, i64 %135
  %137 = bitcast double* %136 to <2 x i64>*
  %138 = load <2 x i64>, <2 x i64>* %137, align 8, !tbaa !3, !alias.scope !11
  %139 = getelementptr double, double* %136, i64 2
  %140 = bitcast double* %139 to <2 x i64>*
  %141 = load <2 x i64>, <2 x i64>* %140, align 8, !tbaa !3, !alias.scope !11
  %142 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %135
  %143 = bitcast double* %142 to <2 x i64>*
  store <2 x i64> %138, <2 x i64>* %143, align 8, !tbaa !3, !alias.scope !14, !noalias !11
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x i64>*
  store <2 x i64> %141, <2 x i64>* %145, align 8, !tbaa !3, !alias.scope !14, !noalias !11
  %146 = add i64 %135, 4
  %147 = icmp eq i64 %146, %25
  br i1 %147, label %148, label %134, !llvm.loop !16

; <label>:148:                                    ; preds = %134
  br i1 %27, label %54, label %105

; <label>:149:                                    ; preds = %149, %98
  %150 = phi double [ %95, %98 ], [ %164, %149 ]
  %151 = phi i64 [ %96, %98 ], [ %165, %149 ]
  %152 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %151
  %153 = load double, double* %152, align 8, !tbaa !3
  %154 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %151, i64 %85
  %155 = load double, double* %154, align 8, !tbaa !3
  %156 = fmul double %153, %155
  %157 = fadd double %150, %156
  store double %157, double* %86, align 8, !tbaa !3
  %158 = add nuw nsw i64 %151, 1
  %159 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %32, i64 %48, i64 %158
  %160 = load double, double* %159, align 8, !tbaa !3
  %161 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %158, i64 %85
  %162 = load double, double* %161, align 8, !tbaa !3
  %163 = fmul double %160, %162
  %164 = fadd double %157, %163
  store double %164, double* %86, align 8, !tbaa !3
  %165 = add nsw i64 %151, 2
  %166 = icmp eq i64 %165, %11
  br i1 %166, label %99, label %149

; <label>:167:                                    ; preds = %167, %45
  %168 = phi i64 [ %44, %45 ], [ %169, %167 ]
  %169 = add nsw i64 %168, 8
  %170 = icmp eq i64 %169, %14
  br i1 %170, label %172, label %167

; <label>:171:                                    ; preds = %54
  br label %174

; <label>:172:                                    ; preds = %167
  br label %173

; <label>:173:                                    ; preds = %172, %43
  br label %174

; <label>:174:                                    ; preds = %173, %171, %31
  %175 = add nuw nsw i64 %32, 1
  %176 = icmp eq i64 %175, %15
  br i1 %176, label %177, label %31

; <label>:177:                                    ; preds = %174
  br label %178

; <label>:178:                                    ; preds = %177, %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  br label %7

; <label>:7:                                      ; preds = %32, %2
  %8 = phi i64 [ 0, %2 ], [ %33, %32 ]
  br label %9

; <label>:9:                                      ; preds = %29, %7
  %10 = phi i64 [ 0, %7 ], [ %30, %29 ]
  %11 = mul nuw nsw i64 %10, %8
  br label %12

; <label>:12:                                     ; preds = %12, %9
  %13 = phi i64 [ 0, %9 ], [ %27, %12 ]
  %14 = add nuw nsw i64 %13, %11
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 160
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.600000e+02
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %8, i64 %10, i64 %13
  store double %18, double* %19, align 8, !tbaa !3
  %20 = or i64 %13, 1
  %21 = add nuw nsw i64 %20, %11
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.600000e+02
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %8, i64 %10, i64 %20
  store double %25, double* %26, align 8, !tbaa !3
  %27 = add nsw i64 %13, 2
  %28 = icmp eq i64 %27, 160
  br i1 %28, label %29, label %12

; <label>:29:                                     ; preds = %12
  %30 = add nuw nsw i64 %10, 1
  %31 = icmp eq i64 %30, 140
  br i1 %31, label %32, label %9

; <label>:32:                                     ; preds = %29
  %33 = add nuw nsw i64 %8, 1
  %34 = icmp eq i64 %33, 150
  br i1 %34, label %35, label %7

; <label>:35:                                     ; preds = %32
  %36 = bitcast i8* %5 to [160 x double]*
  br label %37

; <label>:37:                                     ; preds = %56, %35
  %38 = phi i64 [ %57, %56 ], [ 0, %35 ]
  br label %39

; <label>:39:                                     ; preds = %39, %37
  %40 = phi i64 [ 0, %37 ], [ %54, %39 ]
  %41 = mul nuw nsw i64 %40, %38
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 160
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 1.600000e+02
  %46 = getelementptr inbounds [160 x double], [160 x double]* %36, i64 %38, i64 %40
  store double %45, double* %46, align 8, !tbaa !3
  %47 = or i64 %40, 1
  %48 = mul nuw nsw i64 %47, %38
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 160
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, 1.600000e+02
  %53 = getelementptr inbounds [160 x double], [160 x double]* %36, i64 %38, i64 %47
  store double %52, double* %53, align 8, !tbaa !3
  %54 = add nsw i64 %40, 2
  %55 = icmp eq i64 %54, 160
  br i1 %55, label %56, label %39

; <label>:56:                                     ; preds = %39
  %57 = add nuw nsw i64 %38, 1
  %58 = icmp eq i64 %57, 160
  br i1 %58, label %59, label %37

; <label>:59:                                     ; preds = %56
  tail call void (...) @polybench_timer_start() #4
  %60 = bitcast i8* %4 to double*
  %61 = getelementptr i8, i8* %4, i64 1280
  br label %62

; <label>:62:                                     ; preds = %188, %59
  %63 = phi i64 [ 0, %59 ], [ %189, %188 ]
  %64 = mul i64 %63, 179200
  %65 = add i64 %64, 1280
  br label %66

; <label>:66:                                     ; preds = %75, %62
  %67 = phi i64 [ %76, %75 ], [ 0, %62 ]
  %68 = mul i64 %67, 1280
  %69 = add i64 %64, %68
  %70 = getelementptr i8, i8* %3, i64 %69
  %71 = add i64 %65, %68
  %72 = getelementptr i8, i8* %3, i64 %71
  br label %111

; <label>:73:                                     ; preds = %78
  br label %75

; <label>:74:                                     ; preds = %123
  br label %75

; <label>:75:                                     ; preds = %74, %73
  %76 = add nuw nsw i64 %67, 1
  %77 = icmp eq i64 %76, 140
  br i1 %77, label %188, label %66

; <label>:78:                                     ; preds = %122, %78
  %79 = phi i64 [ 0, %122 ], [ %109, %78 ]
  %80 = getelementptr inbounds double, double* %60, i64 %79
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8, !tbaa !3
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %79
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8, !tbaa !3
  %85 = add nuw nsw i64 %79, 1
  %86 = getelementptr inbounds double, double* %60, i64 %85
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8, !tbaa !3
  %89 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %85
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8, !tbaa !3
  %91 = add nsw i64 %79, 2
  %92 = getelementptr inbounds double, double* %60, i64 %91
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8, !tbaa !3
  %95 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %91
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8, !tbaa !3
  %97 = add nsw i64 %79, 3
  %98 = getelementptr inbounds double, double* %60, i64 %97
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8, !tbaa !3
  %101 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %97
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8, !tbaa !3
  %103 = add nsw i64 %79, 4
  %104 = getelementptr inbounds double, double* %60, i64 %103
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8, !tbaa !3
  %107 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %103
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8, !tbaa !3
  %109 = add nsw i64 %79, 5
  %110 = icmp eq i64 %109, 160
  br i1 %110, label %73, label %78, !llvm.loop !17

; <label>:111:                                    ; preds = %114, %66
  %112 = phi i64 [ 0, %66 ], [ %115, %114 ]
  %113 = getelementptr inbounds double, double* %60, i64 %112
  store double 0.000000e+00, double* %113, align 8, !tbaa !3
  br label %170

; <label>:114:                                    ; preds = %170
  %115 = add nuw nsw i64 %112, 1
  %116 = icmp eq i64 %115, 160
  br i1 %116, label %117, label %111

; <label>:117:                                    ; preds = %114
  %118 = icmp ult i8* %70, %61
  %119 = icmp ult i8* %4, %72
  %120 = and i1 %118, %119
  br i1 %120, label %122, label %121

; <label>:121:                                    ; preds = %117
  br label %123

; <label>:122:                                    ; preds = %117
  br label %78

; <label>:123:                                    ; preds = %123, %121
  %124 = phi i64 [ 0, %121 ], [ %168, %123 ]
  %125 = getelementptr inbounds double, double* %60, i64 %124
  %126 = bitcast double* %125 to <2 x i64>*
  %127 = load <2 x i64>, <2 x i64>* %126, align 8, !tbaa !3, !alias.scope !18
  %128 = getelementptr double, double* %125, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  %130 = load <2 x i64>, <2 x i64>* %129, align 8, !tbaa !3, !alias.scope !18
  %131 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %124
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %127, <2 x i64>* %132, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x i64>*
  store <2 x i64> %130, <2 x i64>* %134, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %135 = or i64 %124, 4
  %136 = getelementptr inbounds double, double* %60, i64 %135
  %137 = bitcast double* %136 to <2 x i64>*
  %138 = load <2 x i64>, <2 x i64>* %137, align 8, !tbaa !3, !alias.scope !18
  %139 = getelementptr double, double* %136, i64 2
  %140 = bitcast double* %139 to <2 x i64>*
  %141 = load <2 x i64>, <2 x i64>* %140, align 8, !tbaa !3, !alias.scope !18
  %142 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %135
  %143 = bitcast double* %142 to <2 x i64>*
  store <2 x i64> %138, <2 x i64>* %143, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x i64>*
  store <2 x i64> %141, <2 x i64>* %145, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %146 = or i64 %124, 8
  %147 = getelementptr inbounds double, double* %60, i64 %146
  %148 = bitcast double* %147 to <2 x i64>*
  %149 = load <2 x i64>, <2 x i64>* %148, align 8, !tbaa !3, !alias.scope !18
  %150 = getelementptr double, double* %147, i64 2
  %151 = bitcast double* %150 to <2 x i64>*
  %152 = load <2 x i64>, <2 x i64>* %151, align 8, !tbaa !3, !alias.scope !18
  %153 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %146
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %149, <2 x i64>* %154, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x i64>*
  store <2 x i64> %152, <2 x i64>* %156, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %157 = or i64 %124, 12
  %158 = getelementptr inbounds double, double* %60, i64 %157
  %159 = bitcast double* %158 to <2 x i64>*
  %160 = load <2 x i64>, <2 x i64>* %159, align 8, !tbaa !3, !alias.scope !18
  %161 = getelementptr double, double* %158, i64 2
  %162 = bitcast double* %161 to <2 x i64>*
  %163 = load <2 x i64>, <2 x i64>* %162, align 8, !tbaa !3, !alias.scope !18
  %164 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %157
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %160, <2 x i64>* %165, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %163, <2 x i64>* %167, align 8, !tbaa !3, !alias.scope !21, !noalias !18
  %168 = add nsw i64 %124, 16
  %169 = icmp eq i64 %168, 160
  br i1 %169, label %74, label %123, !llvm.loop !23

; <label>:170:                                    ; preds = %170, %111
  %171 = phi double [ 0.000000e+00, %111 ], [ %185, %170 ]
  %172 = phi i64 [ 0, %111 ], [ %186, %170 ]
  %173 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %172
  %174 = load double, double* %173, align 8, !tbaa !3
  %175 = getelementptr inbounds [160 x double], [160 x double]* %36, i64 %172, i64 %112
  %176 = load double, double* %175, align 8, !tbaa !3
  %177 = fmul double %174, %176
  %178 = fadd double %171, %177
  store double %178, double* %113, align 8, !tbaa !3
  %179 = or i64 %172, 1
  %180 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %63, i64 %67, i64 %179
  %181 = load double, double* %180, align 8, !tbaa !3
  %182 = getelementptr inbounds [160 x double], [160 x double]* %36, i64 %179, i64 %112
  %183 = load double, double* %182, align 8, !tbaa !3
  %184 = fmul double %181, %183
  %185 = fadd double %178, %184
  store double %185, double* %113, align 8, !tbaa !3
  %186 = add nsw i64 %172, 2
  %187 = icmp eq i64 %186, 160
  br i1 %187, label %114, label %170

; <label>:188:                                    ; preds = %75
  %189 = add nuw nsw i64 %63, 1
  %190 = icmp eq i64 %189, 150
  br i1 %190, label %191, label %62

; <label>:191:                                    ; preds = %188
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %192 = icmp sgt i32 %0, 42
  br i1 %192, label %193, label %236

; <label>:193:                                    ; preds = %191
  %194 = load i8*, i8** %1, align 8, !tbaa !24
  %195 = load i8, i8* %194, align 1, !tbaa !26
  %196 = icmp eq i8 %195, 0
  br i1 %196, label %197, label %236

; <label>:197:                                    ; preds = %193
  %198 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %199 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %198) #5
  %200 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %201 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %200, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %202

; <label>:202:                                    ; preds = %228, %197
  %203 = phi i64 [ 0, %197 ], [ %229, %228 ]
  %204 = mul nuw nsw i64 %203, 22400
  br label %205

; <label>:205:                                    ; preds = %225, %202
  %206 = phi i64 [ 0, %202 ], [ %226, %225 ]
  %207 = mul nuw nsw i64 %206, 160
  %208 = add nuw nsw i64 %207, %204
  br label %209

; <label>:209:                                    ; preds = %218, %205
  %210 = phi i64 [ 0, %205 ], [ %223, %218 ]
  %211 = add nuw nsw i64 %208, %210
  %212 = trunc i64 %211 to i32
  %213 = srem i32 %212, 20
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %218

; <label>:215:                                    ; preds = %209
  %216 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %217 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %216) #5
  br label %218

; <label>:218:                                    ; preds = %215, %209
  %219 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %220 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %6, i64 %203, i64 %206, i64 %210
  %221 = load double, double* %220, align 8, !tbaa !3
  %222 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %219, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %221) #5
  %223 = add nuw nsw i64 %210, 1
  %224 = icmp eq i64 %223, 160
  br i1 %224, label %225, label %209

; <label>:225:                                    ; preds = %218
  %226 = add nuw nsw i64 %206, 1
  %227 = icmp eq i64 %226, 140
  br i1 %227, label %228, label %205

; <label>:228:                                    ; preds = %225
  %229 = add nuw nsw i64 %203, 1
  %230 = icmp eq i64 %229, 150
  br i1 %230, label %231, label %202

; <label>:231:                                    ; preds = %228
  %232 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %233 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %232, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %234 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !24
  %235 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %234) #5
  br label %236

; <label>:236:                                    ; preds = %231, %193, %191
  tail call void @free(i8* nonnull %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !2}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !8, !9}
!17 = distinct !{!17, !8, !9}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !8, !9}
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !5, i64 0}
!26 = !{!5, !5, i64 0}
