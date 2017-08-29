; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
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
  tail call fastcc void @print_array([1200 x double]* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge13.us
  %indvars.iv614.us = phi i64 [ %indvars.iv.next7.us, %._crit_edge13.us ], [ 0, %.preheader.lr.ph ]
  %exitcond8.us = icmp eq i64 %indvars.iv614.us, 0
  br i1 %exitcond8.us, label %._crit_edge.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv614.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit.unr-lcssa, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  %3 = trunc i64 %indvars.iv614.us to i32
  %4 = srem i32 %3, 1000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.000000e+03
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv614.us, i64 0
  store double %6, double* %7, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol.preheader
  %indvars.iv9.us.unr.ph = phi i64 [ 1, %.lr.ph.us.prol.preheader ], [ 0, %.lr.ph.us.preheader ]
  %8 = icmp eq i64 %indvars.iv614.us, 1
  br i1 %8, label %._crit_edge.us, label %.lr.ph.us.preheader30

.lr.ph.us.preheader30:                            ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader30, %.lr.ph.us
  %indvars.iv9.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph.us ], [ %indvars.iv9.us.unr.ph, %.lr.ph.us.preheader30 ]
  %9 = add nuw nsw i64 %indvars.iv9.us, %indvars.iv614.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 1000
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv614.us, i64 %indvars.iv9.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv9.us, 1
  %14 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv614.us
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %12, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.000000e+03>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv9.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv614.us
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph.us.prol.loopexit.unr-lcssa, %.preheader.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv614.us, i64 %indvars.iv614.us
  store double 1.000000e+00, double* %22, align 8
  %23 = add nuw nsw i64 %indvars.iv614.us, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us, %._crit_edge.us.new
  %indvars.iv410.us = phi i64 [ %indvars.iv.next5.us.1, %._crit_edge.us.new ], [ 0, %._crit_edge.us ]
  %24 = sub nsw i64 %23, %indvars.iv410.us
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1200
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv614.us, i64 %indvars.iv410.us
  %indvars.iv.next5.us = or i64 %indvars.iv410.us, 1
  %29 = sub nsw i64 %23, %indvars.iv.next5.us
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1200
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, <double 1.200000e+03, double 1.200000e+03>
  %36 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next5.us.1 = add nsw i64 %indvars.iv410.us, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next5.us.1, 1200
  br i1 %exitcond19.1, label %._crit_edge13.us, label %._crit_edge.us.new

._crit_edge13.us:                                 ; preds = %._crit_edge.us.new
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv614.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next7.us, 1000
  br i1 %exitcond20, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge13.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader9.lr.ph:
  %3 = insertelement <2 x double> undef, double %0, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = insertelement <2 x double> undef, double %0, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge13.us, %.preheader9.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader9.lr.ph ], [ %indvars.iv.next.pre-phi, %._crit_edge13.us ]
  %indvars.iv714.us = phi i64 [ 0, %.preheader9.lr.ph ], [ %indvars.iv.next8.us, %._crit_edge13.us ]
  %exitcond10.us = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond10.us, label %.preheader.us.us.preheader, label %.preheader.us18.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader9.us
  br label %.preheader.us.us

.preheader.us18.preheader:                        ; preds = %.preheader9.us
  %7 = sub i64 1001, %indvars.iv714.us
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %8 = icmp eq i64 %indvars.iv714.us, 998
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv714.us
  %indvars.iv.next4.us22.prol = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader.us18

.preheader.us18:                                  ; preds = %.preheader.us18.preheader, %._crit_edge.us24
  %indvars.iv512.us19 = phi i64 [ %indvars.iv.next6.us25, %._crit_edge.us24 ], [ 0, %.preheader.us18.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv714.us, i64 %indvars.iv512.us19
  br i1 %lcmp.mod, label %.preheader.us18..prol.loopexit.unr-lcssa_crit_edge, label %.prol.preheader

.preheader.us18..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader.us18
  %.pre37.pre = load double, double* %10, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us18
  %11 = load double, double* %9, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv512.us19
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = load double, double* %10, align 8
  %16 = fadd double %15, %14
  store double %16, double* %10, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us18..prol.loopexit.unr-lcssa_crit_edge, %.prol.preheader
  %.pre37 = phi double [ %16, %.prol.preheader ], [ %.pre37.pre, %.preheader.us18..prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv311.us21.unr.ph = phi i64 [ %indvars.iv.next4.us22.prol, %.prol.preheader ], [ %indvars.iv, %.preheader.us18..prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %8, label %._crit_edge.us24, label %.preheader.us18.new.preheader

.preheader.us18.new.preheader:                    ; preds = %.prol.loopexit.unr-lcssa
  br label %.preheader.us18.new

.preheader.us18.new:                              ; preds = %.preheader.us18.new.preheader, %.preheader.us18.new
  %17 = phi double [ %29, %.preheader.us18.new ], [ %.pre37, %.preheader.us18.new.preheader ]
  %indvars.iv311.us21 = phi i64 [ %indvars.iv.next4.us22.1, %.preheader.us18.new ], [ %indvars.iv311.us21.unr.ph, %.preheader.us18.new.preheader ]
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv311.us21, i64 %indvars.iv714.us
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv311.us21, i64 %indvars.iv512.us19
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next4.us22 = add nuw nsw i64 %indvars.iv311.us21, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next4.us22, i64 %indvars.iv714.us
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next4.us22, i64 %indvars.iv512.us19
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next4.us22.1 = add nsw i64 %indvars.iv311.us21, 2
  %exitcond.us23.1 = icmp eq i64 %indvars.iv.next4.us22.1, 1000
  br i1 %exitcond.us23.1, label %._crit_edge.us24.loopexit, label %.preheader.us18.new

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us18.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit.unr-lcssa
  %30 = phi double [ %.pre37, %.prol.loopexit.unr-lcssa ], [ %29, %._crit_edge.us24.loopexit ]
  %31 = fmul double %30, %0
  store double %31, double* %10, align 8
  %indvars.iv.next6.us25 = add nuw nsw i64 %indvars.iv512.us19, 1
  %exitcond = icmp eq i64 %indvars.iv.next6.us25, 1200
  br i1 %exitcond, label %._crit_edge13.us.loopexit42, label %.preheader.us18

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.us
  br label %._crit_edge13.us

._crit_edge13.us.loopexit42:                      ; preds = %._crit_edge.us24
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit42, %._crit_edge13.us.loopexit
  %indvars.iv.next.pre-phi = phi i64 [ 1001, %._crit_edge13.us.loopexit ], [ %indvars.iv.next4.us22.prol, %._crit_edge13.us.loopexit42 ]
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv714.us, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond33, label %._crit_edge17, label %.preheader9.us

.preheader.us.us:                                 ; preds = %.preheader.us.us, %.preheader.us.us.preheader
  %indvars.iv512.us.us = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next6.us.us.3.1, %.preheader.us.us ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv714.us, i64 %indvars.iv512.us.us
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %4
  store <2 x double> %35, <2 x double>* %33, align 8
  %indvars.iv.next6.us.us.1 = or i64 %indvars.iv512.us.us, 2
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv714.us, i64 %indvars.iv.next6.us.us.1
  %37 = bitcast double* %36 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %37, align 8
  %39 = fmul <2 x double> %38, %4
  store <2 x double> %39, <2 x double>* %37, align 8
  %indvars.iv.next6.us.us.3 = or i64 %indvars.iv512.us.us, 4
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv714.us, i64 %indvars.iv.next6.us.us.3
  %41 = bitcast double* %40 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, %6
  store <2 x double> %43, <2 x double>* %41, align 8
  %indvars.iv.next6.us.us.1.1 = or i64 %indvars.iv512.us.us, 6
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv714.us, i64 %indvars.iv.next6.us.us.1.1
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, %6
  store <2 x double> %47, <2 x double>* %45, align 8
  %indvars.iv.next6.us.us.3.1 = add nsw i64 %indvars.iv512.us.us, 8
  %exitcond32.3.1 = icmp eq i64 %indvars.iv.next6.us.us.3.1, 1200
  br i1 %exitcond32.3.1, label %._crit_edge13.us.loopexit, label %.preheader.us.us

._crit_edge17:                                    ; preds = %._crit_edge13.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv25.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %5 = mul nsw i64 %indvars.iv25.us, 1000
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %13 ]
  %7 = add nsw i64 %indvars.iv4.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv25.us, i64 %indvars.iv4.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond10, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
