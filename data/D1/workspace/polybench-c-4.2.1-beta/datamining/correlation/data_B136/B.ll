; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]*) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9, %20 ]
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.200000e+03
  %18 = fadd double %6, %17
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph139.split.us.preheader:
  %sunkaddr92 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  br label %.lr.ph139.split.us

.lr.ph139.split.us:                               ; preds = %._crit_edge136.us, %.lr.ph139.split.us.preheader
  %indvars.iv167 = phi i64 [ 0, %.lr.ph139.split.us.preheader ], [ %indvars.iv.next168, %._crit_edge136.us ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv167
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr89.us = shl nsw i64 %indvars.iv167, 3
  %sunkaddr90.us = add i64 %sunkaddr89.us, %sunkaddr
  %sunkaddr91.us = inttoptr i64 %sunkaddr90.us to double*
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph139.split.us
  %indvars.iv164 = phi i64 [ 0, %.lr.ph139.split.us ], [ %indvars.iv.next165.3, %8 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv164, i64 %indvars.iv167
  %10 = load double, double* %9, align 8
  %11 = load double, double* %sunkaddr91.us, align 8
  %12 = fadd double %10, %11
  store double %12, double* %sunkaddr91.us, align 8
  %indvars.iv.next165 = or i64 %indvars.iv164, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165, i64 %indvars.iv167
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr91.us, align 8
  %indvars.iv.next165.1 = or i64 %indvars.iv164, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165.1, i64 %indvars.iv167
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr91.us, align 8
  %indvars.iv.next165.2 = or i64 %indvars.iv164, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next165.2, i64 %indvars.iv167
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr91.us, align 8
  %indvars.iv.next165.3 = add nsw i64 %indvars.iv164, 4
  %exitcond166.3 = icmp eq i64 %indvars.iv.next165.3, 1400
  br i1 %exitcond166.3, label %._crit_edge136.us, label %8

._crit_edge136.us:                                ; preds = %8
  %sunkaddr93.us = shl nsw i64 %indvars.iv167, 3
  %sunkaddr94.us = add i64 %sunkaddr93.us, %sunkaddr92
  %sunkaddr95.us = inttoptr i64 %sunkaddr94.us to double*
  %22 = load double, double* %sunkaddr95.us, align 8
  %23 = fdiv double %22, %2
  store double %23, double* %sunkaddr95.us, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next168, 1200
  br i1 %exitcond169, label %.lr.ph132.split.us.preheader, label %.lr.ph139.split.us

.lr.ph132.split.us.preheader:                     ; preds = %._crit_edge136.us
  %sunkaddr100 = ptrtoint double* %6 to i64
  %sunkaddr96 = ptrtoint double* %6 to i64
  br label %.lr.ph132.split.us

.lr.ph132.split.us:                               ; preds = %._crit_edge130.us, %.lr.ph132.split.us.preheader
  %indvars.iv161 = phi i64 [ 0, %.lr.ph132.split.us.preheader ], [ %indvars.iv.next162, %._crit_edge130.us ]
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv161
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv161
  %sunkaddr97.us = shl nsw i64 %indvars.iv161, 3
  %sunkaddr98.us = add i64 %sunkaddr97.us, %sunkaddr96
  %sunkaddr99.us = inttoptr i64 %sunkaddr98.us to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph132.split.us
  %indvars.iv158 = phi i64 [ 0, %.lr.ph132.split.us ], [ %indvars.iv.next159.1, %26 ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv158, i64 %indvars.iv161
  %28 = load double, double* %27, align 8
  %29 = load double, double* %25, align 8
  %30 = fsub double %28, %29
  %31 = fmul double %30, %30
  %32 = load double, double* %sunkaddr99.us, align 8
  %33 = fadd double %32, %31
  store double %33, double* %sunkaddr99.us, align 8
  %indvars.iv.next159 = or i64 %indvars.iv158, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next159, i64 %indvars.iv161
  %35 = load double, double* %34, align 8
  %36 = load double, double* %25, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = load double, double* %sunkaddr99.us, align 8
  %40 = fadd double %39, %38
  store double %40, double* %sunkaddr99.us, align 8
  %indvars.iv.next159.1 = add nsw i64 %indvars.iv158, 2
  %exitcond160.1 = icmp eq i64 %indvars.iv.next159.1, 1400
  br i1 %exitcond160.1, label %._crit_edge130.us, label %26

._crit_edge130.us:                                ; preds = %26
  %sunkaddr101.us = shl nsw i64 %indvars.iv161, 3
  %sunkaddr102.us = add i64 %sunkaddr101.us, %sunkaddr100
  %sunkaddr103.us = inttoptr i64 %sunkaddr102.us to double*
  %41 = load double, double* %sunkaddr103.us, align 8
  %42 = fdiv double %41, %2
  store double %42, double* %sunkaddr103.us, align 8
  %43 = tail call double @sqrt(double %42) #4
  %44 = fcmp ugt double %43, 1.000000e-01
  %45 = select i1 %44, double %43, double 1.000000e+00
  store double %45, double* %sunkaddr103.us, align 8
  %indvars.iv.next162 = add nuw nsw i64 %indvars.iv161, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next162, 1200
  br i1 %exitcond163, label %.preheader104.us.preheader, label %.lr.ph132.split.us

.preheader104.us.preheader:                       ; preds = %._crit_edge130.us
  br label %.preheader104.us

.preheader104.us:                                 ; preds = %.preheader104.us.preheader, %._crit_edge125.us
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %._crit_edge125.us ], [ 0, %.preheader104.us.preheader ]
  br label %46

; <label>:46:                                     ; preds = %46, %.preheader104.us
  %indvars.iv152 = phi i64 [ 0, %.preheader104.us ], [ %indvars.iv.next153, %46 ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv152
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv155, i64 %indvars.iv152
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %52 = tail call double @sqrt(double %2) #4
  %53 = getelementptr inbounds double, double* %6, i64 %indvars.iv152
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %49, align 8
  %57 = fdiv double %56, %55
  store double %57, double* %49, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next153, 1200
  br i1 %exitcond154, label %._crit_edge125.us, label %46

._crit_edge125.us:                                ; preds = %46
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next156, 1400
  br i1 %exitcond157, label %.lr.ph.us.us.preheader.preheader, label %.preheader104.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge125.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge112.us-lcssa.us.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge112.us-lcssa.us.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge112.us-lcssa.us.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv149
  store double 1.000000e+00, double* %58, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  br label %.lr.ph.us.us

._crit_edge112.us-lcssa.us.us:                    ; preds = %._crit_edge.us.us
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next150, 1199
  br i1 %exitcond151, label %._crit_edge115, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv146 = phi i64 [ %indvars.iv144, %.lr.ph.us.us.preheader ], [ %indvars.iv.next147, %._crit_edge.us.us ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv149, i64 %indvars.iv146
  store double 0.000000e+00, double* %59, align 8
  br label %64

._crit_edge.us.us:                                ; preds = %64
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv146, i64 %indvars.iv149
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond = icmp eq i64 %indvars.iv.next147, 1200
  br i1 %exitcond, label %._crit_edge112.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:64:                                     ; preds = %64, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %64 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv149
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv146
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load double, double* %59, align 8
  %71 = fadd double %70, %69
  store double %71, double* %59, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv149
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv146
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = load double, double* %59, align 8
  %78 = fadd double %77, %76
  store double %78, double* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %64

._crit_edge115:                                   ; preds = %._crit_edge112.us-lcssa.us.us
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %79, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv12, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
