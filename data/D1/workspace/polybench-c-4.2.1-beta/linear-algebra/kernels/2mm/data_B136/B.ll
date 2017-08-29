; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array([1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.._crit_edge_crit_edge.us
  %indvars.iv84 = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next85, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv84, %indvars.iv10
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv84
  store double %11, double* %12, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next85, 1100
  br i1 %exitcond86, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond12, label %._crit_edge46.._crit_edge47_crit_edge.us.preheader, label %.._crit_edge_crit_edge.us

._crit_edge46.._crit_edge47_crit_edge.us.preheader: ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge46.._crit_edge47_crit_edge.us

._crit_edge46.._crit_edge47_crit_edge.us:         ; preds = %._crit_edge47._crit_edge.us, %._crit_edge46.._crit_edge47_crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge47._crit_edge.us ], [ 0, %._crit_edge46.._crit_edge47_crit_edge.us.preheader ]
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %._crit_edge47.us, %._crit_edge46.._crit_edge47_crit_edge.us
  %indvars.iv80 = phi i64 [ 0, %._crit_edge46.._crit_edge47_crit_edge.us ], [ %indvars.iv.next81.1, %._crit_edge47.us ]
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %13 = mul nuw nsw i64 %indvars.iv.next81, %indvars.iv7
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 9.000000e+02
  %18 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv80
  store double %17, double* %18, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %19 = mul nuw nsw i64 %indvars.iv.next81.1, %indvars.iv7
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv.next81
  store double %23, double* %24, align 8
  %exitcond82.1 = icmp eq i64 %indvars.iv.next81.1, 900
  br i1 %exitcond82.1, label %._crit_edge47._crit_edge.us, label %._crit_edge47.us

._crit_edge47._crit_edge.us:                      ; preds = %._crit_edge47.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1100
  br i1 %exitcond9, label %._crit_edge48.._crit_edge49_crit_edge.us.preheader, label %._crit_edge46.._crit_edge47_crit_edge.us

._crit_edge48.._crit_edge49_crit_edge.us.preheader: ; preds = %._crit_edge47._crit_edge.us
  br label %._crit_edge48.._crit_edge49_crit_edge.us

._crit_edge48.._crit_edge49_crit_edge.us:         ; preds = %._crit_edge49._crit_edge.us, %._crit_edge48.._crit_edge49_crit_edge.us.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge49._crit_edge.us ], [ 0, %._crit_edge48.._crit_edge49_crit_edge.us.preheader ]
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us, %._crit_edge48.._crit_edge49_crit_edge.us
  %indvars.iv76 = phi i64 [ 0, %._crit_edge48.._crit_edge49_crit_edge.us ], [ %indvars.iv.next77, %._crit_edge49.us ]
  %25 = add nuw nsw i64 %indvars.iv76, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv4
  %27 = add nuw nsw i64 %26, 1
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1200
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.200000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv76
  store double %31, double* %32, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next77, 1200
  br i1 %exitcond78, label %._crit_edge49._crit_edge.us, label %._crit_edge49.us

._crit_edge49._crit_edge.us:                      ; preds = %._crit_edge49.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 900
  br i1 %exitcond6, label %._crit_edge50.._crit_edge51_crit_edge.us.preheader, label %._crit_edge48.._crit_edge49_crit_edge.us

._crit_edge50.._crit_edge51_crit_edge.us.preheader: ; preds = %._crit_edge49._crit_edge.us
  br label %._crit_edge50.._crit_edge51_crit_edge.us

._crit_edge50.._crit_edge51_crit_edge.us:         ; preds = %._crit_edge51._crit_edge.us, %._crit_edge50.._crit_edge51_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge51._crit_edge.us ], [ 0, %._crit_edge50.._crit_edge51_crit_edge.us.preheader ]
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us, %._crit_edge50.._crit_edge51_crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge50.._crit_edge51_crit_edge.us ], [ %indvars.iv.next, %._crit_edge51.us ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.100000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge51._crit_edge.us, label %._crit_edge51.us

._crit_edge51._crit_edge.us:                      ; preds = %._crit_edge51.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge50._crit_edge, label %._crit_edge50.._crit_edge51_crit_edge.us

._crit_edge50._crit_edge:                         ; preds = %._crit_edge51._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.us.preheader:
  br label %.lr.ph57.us.us.preheader

.lr.ph57.us.us.preheader:                         ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvar = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %indvar.next, %._crit_edge._crit_edge.us ]
  %storemerge61.us = phi i64 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %8, %._crit_edge._crit_edge.us ]
  %sext = shl i64 %storemerge61.us, 32
  %7 = ashr exact i64 %sext, 32
  br label %.lr.ph57.us.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge58.us.us
  %8 = add nsw i64 %7, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 800
  br i1 %exitcond, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph57.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph57.us.us:                                   ; preds = %._crit_edge58.us.us, %.lr.ph57.us.us.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge58.us.us ], [ 0, %.lr.ph57.us.us.preheader ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %7, i64 %indvars.iv5
  store double 0.000000e+00, double* %9, align 8
  br label %10

._crit_edge58.us.us:                              ; preds = %10
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 900
  br i1 %exitcond7, label %._crit_edge._crit_edge.us, label %.lr.ph57.us.us

; <label>:10:                                     ; preds = %10, %.lr.ph57.us.us
  %indvars.iv82 = phi i64 [ 0, %.lr.ph57.us.us ], [ %indvars.iv.next83.1, %10 ]
  %11 = phi double [ 0.000000e+00, %.lr.ph57.us.us ], [ %25, %10 ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %7, i64 %indvars.iv82
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %0
  %15 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv5
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %11, %17
  store double %18, double* %9, align 8
  %indvars.iv.next83 = or i64 %indvars.iv82, 1
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %7, i64 %indvars.iv.next83
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %0
  %22 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next83, i64 %indvars.iv5
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %18, %24
  store double %25, double* %9, align 8
  %indvars.iv.next83.1 = add nuw nsw i64 %indvars.iv82, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next83.1, 1100
  br i1 %exitcond.1, label %._crit_edge58.us.us, label %10

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge41._crit_edge.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge41._crit_edge.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge41._crit_edge.us:                      ; preds = %._crit_edge44.us.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 800
  br i1 %exitcond4, label %._crit_edge40._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge44.us.us, %.lr.ph.us.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge44.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv2, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %1
  store double %28, double* %26, align 8
  br label %29

._crit_edge44.us.us:                              ; preds = %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond1, label %._crit_edge41._crit_edge.us, label %.lr.ph.us.us

; <label>:29:                                     ; preds = %29, %.lr.ph.us.us
  %indvars.iv77 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next78.2, %29 ]
  %30 = phi double [ %28, %.lr.ph.us.us ], [ %48, %29 ]
  %31 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv77
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv77, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %26, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %37 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv.next78
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next78, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %26, align 8
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  %43 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv.next78.1
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next78.1, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %26, align 8
  %indvars.iv.next78.2 = add nuw nsw i64 %indvars.iv77, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next78.2, 900
  br i1 %exitcond.2, label %._crit_edge44.us.us, label %29

._crit_edge40._crit_edge:                         ; preds = %._crit_edge41._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 800
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
