; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader5.lr.ph:
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge8.us, %.preheader5.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next, %._crit_edge8.us ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader5.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %3 ], [ 0, %.preheader5.us ]
  %4 = mul nuw nsw i64 %indvars.iv26, %indvars.iv
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv26
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv26
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond1, label %._crit_edge8.us, label %3

._crit_edge8.us:                                  ; preds = %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond2, label %._crit_edge.us.preheader, label %.preheader5.us

._crit_edge.us.preheader:                         ; preds = %._crit_edge8.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.us.preheader
  %indvar = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvar.next.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar, i64 0
  %scevgep31 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next = or i64 %indvar, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next, i64 0
  %scevgep31.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.1, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.1 = or i64 %indvar, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.1, i64 0
  %scevgep31.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.2, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.2 = or i64 %indvar, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.2, i64 0
  %scevgep31.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.3, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.3 = or i64 %indvar, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.3, i64 0
  %scevgep31.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.4, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.4 = or i64 %indvar, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.4, i64 0
  %scevgep31.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.5, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.5 = or i64 %indvar, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.5, i64 0
  %scevgep31.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.6, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.6 = or i64 %indvar, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvar.next.6, i64 0
  %scevgep31.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep31.7, i8 0, i64 9600, i32 8, i1 false)
  %indvar.next.7 = add nsw i64 %indvar, 8
  %exitcond.7 = icmp eq i64 %indvar.next.7, 1200
  br i1 %exitcond.7, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.lr.ph18:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge16, %.lr.ph18
  %indvars.iv92 = phi i64 [ 0, %.lr.ph18 ], [ %indvars.iv.next93, %._crit_edge16 ]
  %indvars.iv82 = phi i64 [ 1, %.lr.ph18 ], [ %indvars.iv.next83, %._crit_edge16 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ 0, %.lr.ph ]
  %3 = phi double [ %19, %.lr.ph.new ], [ 0.000000e+00, %.lr.ph ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv92
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %5
  %7 = fadd double %3, %6
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv92
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fadd double %7, %10
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv92
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %13
  %15 = fadd double %11, %14
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv92
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = fadd double %15, %18
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  %20 = tail call double @sqrt(double %19) #4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double %20, double* %21, align 8
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %._crit_edge, %.lr.ph7.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph7.new ], [ 0, %._crit_edge ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv54, i64 %indvars.iv92
  %23 = load double, double* %22, align 8
  %24 = load double, double* %21, align 8
  %25 = fdiv double %23, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv92
  store double %25, double* %26, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next55, i64 %indvars.iv92
  %28 = load double, double* %27, align 8
  %29 = load double, double* %21, align 8
  %30 = fdiv double %28, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next55, i64 %indvars.iv92
  store double %30, double* %31, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next55.1, 1000
  br i1 %exitcond.1, label %._crit_edge8, label %.lr.ph7.new

._crit_edge8:                                     ; preds = %.lr.ph7.new
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %32 = icmp slt i64 %indvars.iv.next93, 1200
  br i1 %32, label %.lr.ph15.split.us.preheader, label %._crit_edge16

.lr.ph15.split.us.preheader:                      ; preds = %._crit_edge8
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %.lr.ph15.split.us.preheader, %._crit_edge12.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge12.us ], [ %indvars.iv82, %.lr.ph15.split.us.preheader ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv84
  store double 0.000000e+00, double* %33, align 8
  br label %.lr.ph15.split.us.new

.lr.ph15.split.us.new:                            ; preds = %.lr.ph15.split.us, %.lr.ph15.split.us.new
  %34 = phi double [ %46, %.lr.ph15.split.us.new ], [ 0.000000e+00, %.lr.ph15.split.us ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph15.split.us.new ], [ 0, %.lr.ph15.split.us ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv78, i64 %indvars.iv92
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv78, i64 %indvars.iv84
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %39, %34
  store double %40, double* %33, align 8
  %indvars.iv.next79 = or i64 %indvars.iv78, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next79, i64 %indvars.iv92
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next79, i64 %indvars.iv84
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %45, %40
  store double %46, double* %33, align 8
  %indvars.iv.next79.1 = add nuw nsw i64 %indvars.iv78, 2
  %exitcond.1113 = icmp eq i64 %indvars.iv.next79.1, 1000
  br i1 %exitcond.1113, label %.lr.ph11.us.new.preheader, label %.lr.ph15.split.us.new

.lr.ph11.us.new.preheader:                        ; preds = %.lr.ph15.split.us.new
  br label %.lr.ph11.us.new

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.1, %.lr.ph11.us.new ], [ 0, %.lr.ph11.us.new.preheader ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv84
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv80, i64 %indvars.iv92
  %50 = load double, double* %49, align 8
  %51 = load double, double* %33, align 8
  %52 = fmul double %50, %51
  %53 = fsub double %48, %52
  store double %53, double* %47, align 8
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next81, i64 %indvars.iv84
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next81, i64 %indvars.iv92
  %57 = load double, double* %56, align 8
  %58 = load double, double* %33, align 8
  %59 = fmul double %57, %58
  %60 = fsub double %55, %59
  store double %60, double* %54, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond.1119 = icmp eq i64 %indvars.iv.next81.1, 1000
  br i1 %exitcond.1119, label %._crit_edge12.us, label %.lr.ph11.us.new

._crit_edge12.us:                                 ; preds = %.lr.ph11.us.new
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond = icmp eq i64 %indvars.iv.next85, 1200
  br i1 %exitcond, label %._crit_edge16.loopexit, label %.lr.ph15.split.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next93, 1200
  br i1 %exitcond1, label %._crit_edge19, label %.lr.ph

._crit_edge19:                                    ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader7.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.lr.ph
  %indvars.iv40 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next41, %._crit_edge11.us ]
  %6 = mul nuw nsw i64 %indvars.iv40, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader7.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %14 ], [ 0, %.preheader7.us ]
  %8 = add nuw nsw i64 %6, %indvars.iv31
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv31
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond2, label %._crit_edge11.us, label %7

._crit_edge11.us:                                 ; preds = %14
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond3, label %._crit_edge13, label %.preheader7.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge13
  %indvars.iv37 = phi i64 [ 0, %._crit_edge13 ], [ %indvars.iv.next38, %._crit_edge.us ]
  %23 = mul nuw nsw i64 %indvars.iv37, 1200
  br label %24

; <label>:24:                                     ; preds = %31, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %31 ], [ 0, %.preheader.us ]
  %25 = add nuw nsw i64 %23, %indvars.iv
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #6
  br label %31

; <label>:31:                                     ; preds = %29, %24
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv37, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
