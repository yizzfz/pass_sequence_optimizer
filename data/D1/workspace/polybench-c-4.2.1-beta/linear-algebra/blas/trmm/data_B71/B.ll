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
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.us.preheader
  %indvars.iv513.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6.us, %._crit_edge12.us ]
  %exitcond7.us = icmp eq i64 %indvars.iv513.us, 0
  br i1 %exitcond7.us, label %._crit_edge.us.new, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv513.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.preheader
  %5 = trunc i64 %indvars.iv513.us to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv513.us, i64 0
  store double %8, double* %9, align 8
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv8.us.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  %10 = icmp eq i64 %indvars.iv513.us, 1
  br i1 %10, label %._crit_edge.us.new, label %.lr.ph.us.preheader24

.lr.ph.us.preheader24:                            ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader24, %.lr.ph.us
  %indvars.iv8.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph.us ], [ %indvars.iv8.us.unr.ph, %.lr.ph.us.preheader24 ]
  %11 = add nuw nsw i64 %indvars.iv8.us, %indvars.iv513.us
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1000
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv513.us, i64 %indvars.iv8.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %16 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv513.us
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %14, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fdiv <2 x double> %21, <double 1.000000e+03, double 1.000000e+03>
  %23 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv8.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv513.us
  br i1 %exitcond.us.1, label %._crit_edge.us.new.loopexit, label %.lr.ph.us

._crit_edge.us.new.loopexit:                      ; preds = %.lr.ph.us
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.loopexit, %.lr.ph.us.prol.loopexit, %.preheader.us
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv513.us, i64 %indvars.iv513.us
  store double 1.000000e+00, double* %24, align 8
  %25 = add nuw nsw i64 %indvars.iv513.us, 1200
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.us.new
  %indvars.iv39.us = phi i64 [ 0, %._crit_edge.us.new ], [ %indvars.iv.next4.us.1, %._crit_edge ]
  %26 = sub nuw nsw i64 %25, %indvars.iv39.us
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513.us, i64 %indvars.iv39.us
  %indvars.iv.next4.us = or i64 %indvars.iv39.us, 1
  %31 = sub nuw nsw i64 %25, %indvars.iv.next4.us
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = insertelement <2 x double> undef, double %29, i32 0
  %36 = insertelement <2 x double> %35, double %34, i32 1
  %37 = fdiv <2 x double> %36, <double 1.200000e+03, double 1.200000e+03>
  %38 = bitcast double* %30 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next4.us.1 = add nuw nsw i64 %indvars.iv39.us, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next4.us.1, 1200
  br i1 %exitcond17.1, label %._crit_edge12.us, label %._crit_edge

._crit_edge12.us:                                 ; preds = %._crit_edge
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv513.us, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond20, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader7.us.preheader:
  %5 = insertelement <2 x double> undef, double %2, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %.preheader7.us.preheader
  %indvars.iv = phi i64 [ 1, %.preheader7.us.preheader ], [ %indvars.iv.next.pre-phi, %._crit_edge11.us ]
  %indvars.iv512.us = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next6.us, %._crit_edge11.us ]
  %exitcond8.us = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond8.us, label %.preheader.us.us.preheader, label %.preheader.us17.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader7.us
  br label %.preheader.us.us

.preheader.us17.preheader:                        ; preds = %.preheader7.us
  %7 = sub nuw nsw i64 999, %indvars.iv512.us
  %xtraiter = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %8 = icmp eq i64 %indvars.iv512.us, 998
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv512.us
  %indvars.iv.next2.us20.prol = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader.us17

.preheader.us17:                                  ; preds = %._crit_edge.us24, %.preheader.us17.preheader
  %indvars.iv310.us18 = phi i64 [ 0, %.preheader.us17.preheader ], [ %indvars.iv.next4.us22, %._crit_edge.us24 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv512.us, i64 %indvars.iv310.us18
  br i1 %lcmp.mod, label %.preheader.us17..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us17..prol.loopexit_crit_edge:         ; preds = %.preheader.us17
  %.pre35.pre = load double, double* %10, align 8
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us17
  %11 = load double, double* %9, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv310.us18
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = load double, double* %10, align 8
  %16 = fadd double %15, %14
  store double %16, double* %10, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us17..prol.loopexit_crit_edge, %.prol.preheader
  %.pre35 = phi double [ %16, %.prol.preheader ], [ %.pre35.pre, %.preheader.us17..prol.loopexit_crit_edge ]
  %indvars.iv19.us19.unr.ph = phi i64 [ %indvars.iv.next2.us20.prol, %.prol.preheader ], [ %indvars.iv, %.preheader.us17..prol.loopexit_crit_edge ]
  br i1 %8, label %._crit_edge.us24, label %.preheader.us17.new.preheader

.preheader.us17.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader.us17.new

.preheader.us17.new:                              ; preds = %.preheader.us17.new.preheader, %.preheader.us17.new
  %17 = phi double [ %29, %.preheader.us17.new ], [ %.pre35, %.preheader.us17.new.preheader ]
  %indvars.iv19.us19 = phi i64 [ %indvars.iv.next2.us20.1, %.preheader.us17.new ], [ %indvars.iv19.us19.unr.ph, %.preheader.us17.new.preheader ]
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv19.us19, i64 %indvars.iv512.us
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv19.us19, i64 %indvars.iv310.us18
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next2.us20 = add nuw nsw i64 %indvars.iv19.us19, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next2.us20, i64 %indvars.iv512.us
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next2.us20, i64 %indvars.iv310.us18
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next2.us20.1 = add nsw i64 %indvars.iv19.us19, 2
  %exitcond.us21.1 = icmp eq i64 %indvars.iv.next2.us20.1, 1000
  br i1 %exitcond.us21.1, label %._crit_edge.us24.loopexit, label %.preheader.us17.new

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us17.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit
  %30 = phi double [ %.pre35, %.prol.loopexit ], [ %29, %._crit_edge.us24.loopexit ]
  %31 = fmul double %30, %2
  store double %31, double* %10, align 8
  %indvars.iv.next4.us22 = add nuw nsw i64 %indvars.iv310.us18, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us22, 1200
  br i1 %exitcond, label %._crit_edge11.us.loopexit37, label %.preheader.us17

._crit_edge11.us.loopexit:                        ; preds = %.preheader.us.us
  br label %._crit_edge11.us

._crit_edge11.us.loopexit37:                      ; preds = %._crit_edge.us24
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit37, %._crit_edge11.us.loopexit
  %indvars.iv.next.pre-phi = phi i64 [ 1001, %._crit_edge11.us.loopexit ], [ %indvars.iv.next2.us20.prol, %._crit_edge11.us.loopexit37 ]
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv512.us, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond32, label %._crit_edge16, label %.preheader7.us

.preheader.us.us:                                 ; preds = %.preheader.us.us, %.preheader.us.us.preheader
  %indvars.iv310.us.us = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next4.us.us.3.1, %.preheader.us.us ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv512.us, i64 %indvars.iv310.us.us
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %6
  store <2 x double> %35, <2 x double>* %33, align 8
  %indvars.iv.next4.us.us.1 = or i64 %indvars.iv310.us.us, 2
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv512.us, i64 %indvars.iv.next4.us.us.1
  %37 = bitcast double* %36 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %37, align 8
  %39 = fmul <2 x double> %38, %6
  store <2 x double> %39, <2 x double>* %37, align 8
  %indvars.iv.next4.us.us.3 = or i64 %indvars.iv310.us.us, 4
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv512.us, i64 %indvars.iv.next4.us.us.3
  %41 = bitcast double* %40 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, %6
  store <2 x double> %43, <2 x double>* %41, align 8
  %indvars.iv.next4.us.us.1.1 = or i64 %indvars.iv310.us.us, 6
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv512.us, i64 %indvars.iv.next4.us.us.1.1
  %45 = bitcast double* %44 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %45, align 8
  %47 = fmul <2 x double> %46, %6
  store <2 x double> %47, <2 x double>* %45, align 8
  %indvars.iv.next4.us.us.3.1 = add nsw i64 %indvars.iv310.us.us, 8
  %exitcond29.3.1 = icmp eq i64 %indvars.iv.next4.us.us.3.1, 1200
  br i1 %exitcond29.3.1, label %._crit_edge11.us.loopexit, label %.preheader.us.us

._crit_edge16:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next2.us, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv14.us, 1000
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv3.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv3.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14.us, i64 %indvars.iv3.us
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next2.us, 1000
  br i1 %exitcond8, label %._crit_edge6, label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
