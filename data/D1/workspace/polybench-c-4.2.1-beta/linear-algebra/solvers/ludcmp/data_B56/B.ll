; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv34 = phi i64 [ 0, %4 ], [ %indvars.iv.next35.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv34
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv34
  %8 = bitcast double* %7 to <2 x double>*
  %9 = trunc i64 %indvars.iv34 to i32
  %10 = or i32 %9, 1
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv34
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %13 = trunc i64 %indvars.iv.next35.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond36.1 = icmp eq i64 %indvars.iv.next35.1, 2000
  br i1 %exitcond36.1, label %.lr.ph21.preheader, label %._crit_edge

.lr.ph21.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader, %.lr.ph21.backedge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.lr.ph21.backedge ], [ 0, %.lr.ph21.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv29.be, %.lr.ph21.backedge ], [ 1, %.lr.ph21.preheader ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.lr.ph21
  %indvars.iv19 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next20, %._crit_edge44 ]
  %21 = sub nsw i64 0, %indvars.iv19
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 2000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 2.000000e+03
  %26 = fadd double %25, 1.000000e+00
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv19
  store double %26, double* %27, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %indvars.iv29
  br i1 %exitcond23, label %._crit_edge22, label %._crit_edge44

._crit_edge22:                                    ; preds = %._crit_edge44
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %28 = icmp slt i64 %indvars.iv.next32, 2000
  br i1 %28, label %._crit_edge26.thread, label %._crit_edge26

._crit_edge26.thread:                             ; preds = %._crit_edge22
  %29 = mul i64 %indvars.iv31, 2001
  %30 = add i64 %29, 1
  %31 = mul i64 %indvars.iv31, -8
  %32 = add i64 %31, 15992
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %30
  %33 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %33, i8 0, i64 %32, i32 8, i1 false)
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %34, align 8
  br label %.lr.ph21.backedge

._crit_edge26:                                    ; preds = %._crit_edge22
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %35, align 8
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond33, label %.preheader1.lr.ph, label %.lr.ph21.backedge

.lr.ph21.backedge:                                ; preds = %._crit_edge26, %._crit_edge26.thread
  %indvars.iv29.be = add nuw nsw i64 %indvars.iv29, 1
  br label %.lr.ph21

.preheader1.lr.ph:                                ; preds = %._crit_edge26
  %36 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %37 = bitcast i8* %36 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 32000000, i32 8, i1 false)
  br label %.lr.ph10.us.us.preheader

.lr.ph10.us.us.preheader:                         ; preds = %._crit_edge13.us, %.preheader1.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next11, %._crit_edge13.us ]
  br label %.lr.ph10.us.us

._crit_edge13.us:                                 ; preds = %._crit_edge11.us.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.lr.ph7.split.us.preheader, label %.lr.ph10.us.us.preheader

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge13.us
  br label %.lr.ph7.split.us

.lr.ph10.us.us:                                   ; preds = %._crit_edge11.us.us, %.lr.ph10.us.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph10.us.us.preheader ], [ %indvars.iv.next8, %._crit_edge11.us.us ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv10
  br label %._crit_edge45

._crit_edge11.us.us:                              ; preds = %._crit_edge45
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %._crit_edge13.us, label %.lr.ph10.us.us

._crit_edge45:                                    ; preds = %._crit_edge45, %.lr.ph10.us.us
  %indvars.iv4 = phi i64 [ 0, %.lr.ph10.us.us ], [ %indvars.iv.next5.1, %._crit_edge45 ]
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv10
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  store double %45, double* %43, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %46 = load double, double* %38, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv10
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %51 = load double, double* %50, align 8
  %52 = fadd double %49, %51
  store double %52, double* %50, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %._crit_edge11.us.us, label %._crit_edge45

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.4, %._crit_edge46 ]
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1, i64 %indvars.iv
  %54 = bitcast double* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us, label %._crit_edge46

._crit_edge.us:                                   ; preds = %._crit_edge46
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge8, label %.lr.ph7.split.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %36) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge24._crit_edge

._crit_edge24._crit_edge:                         ; preds = %._crit_edge24, %4
  %indvars.iv48 = phi i64 [ 0, %4 ], [ %indvars.iv.next49, %._crit_edge24 ]
  %5 = icmp sgt i64 %indvars.iv48, 0
  br i1 %5, label %.lr.ph15.preheader, label %._crit_edge24

.lr.ph15.preheader:                               ; preds = %._crit_edge24._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 0
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %._crit_edge12, %.lr.ph15.preheader
  %indvars.iv27 = phi i64 [ 0, %.lr.ph15.preheader ], [ %indvars.iv.next28, %._crit_edge12 ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv27
  %8 = load double, double* %7, align 8
  %9 = icmp sgt i64 %indvars.iv27, 0
  br i1 %9, label %.lr.ph11.preheader, label %._crit_edge12

.lr.ph11.preheader:                               ; preds = %.lr.ph15
  %xtraiter57 = and i64 %indvars.iv27, 1
  %lcmp.mod58 = icmp eq i64 %xtraiter57, 0
  br i1 %lcmp.mod58, label %.lr.ph11.prol.loopexit, label %.lr.ph11.prol

.lr.ph11.prol:                                    ; preds = %.lr.ph11.preheader
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv27
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %8, %13
  br label %.lr.ph11.prol.loopexit

.lr.ph11.prol.loopexit:                           ; preds = %.lr.ph11.preheader, %.lr.ph11.prol
  %indvars.iv20.unr.ph = phi i64 [ 1, %.lr.ph11.prol ], [ 0, %.lr.ph11.preheader ]
  %.unr59.ph = phi double [ %14, %.lr.ph11.prol ], [ %8, %.lr.ph11.preheader ]
  %.lcssa5.unr.ph = phi double [ %14, %.lr.ph11.prol ], [ undef, %.lr.ph11.preheader ]
  %15 = icmp eq i64 %indvars.iv27, 1
  br i1 %15, label %._crit_edge12, label %.lr.ph11.preheader108

.lr.ph11.preheader108:                            ; preds = %.lr.ph11.prol.loopexit
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph11.preheader108, %.lr.ph11
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.lr.ph11 ], [ %indvars.iv20.unr.ph, %.lr.ph11.preheader108 ]
  %16 = phi double [ %30, %.lr.ph11 ], [ %.unr59.ph, %.lr.ph11.preheader108 ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv20
  %18 = bitcast double* %17 to <2 x double>*
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv27
  %20 = load double, double* %19, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %21 = load <2 x double>, <2 x double>* %18, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next21, i64 %indvars.iv27
  %23 = load double, double* %22, align 8
  %24 = insertelement <2 x double> undef, double %20, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %21, %25
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %16, %27
  %30 = fsub double %29, %28
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next21.1, %indvars.iv27
  br i1 %exitcond26.1, label %._crit_edge12.loopexit, label %.lr.ph11

._crit_edge12.loopexit:                           ; preds = %.lr.ph11
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.lr.ph11.prol.loopexit, %.lr.ph15
  %.lcssa3133 = phi double [ %8, %.lr.ph15 ], [ %.lcssa5.unr.ph, %.lr.ph11.prol.loopexit ], [ %30, %._crit_edge12.loopexit ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv27
  %32 = load double, double* %31, align 8
  %33 = fdiv double %.lcssa3133, %32
  store double %33, double* %7, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next28, %indvars.iv48
  br i1 %exitcond32, label %.lr.ph23.split.us.preheader, label %.lr.ph15

.lr.ph23.split.us.preheader:                      ; preds = %._crit_edge12
  %xtraiter62 = and i64 %indvars.iv48, 1
  %34 = icmp eq i64 %xtraiter62, 0
  %35 = icmp eq i64 %indvars.iv48, 1
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph23.split.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv48, %.lr.ph23.split.us.preheader ], [ %indvars.iv.next44, %._crit_edge20.us ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv43
  %37 = load double, double* %36, align 8
  br i1 %34, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph23.split.us
  %38 = load double, double* %6, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv43
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %37, %41
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph23.split.us, %.prol.preheader60
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph23.split.us ]
  %.unr64.ph = phi double [ %42, %.prol.preheader60 ], [ %37, %.lr.ph23.split.us ]
  %.lcssa7.unr.ph = phi double [ %42, %.prol.preheader60 ], [ undef, %.lr.ph23.split.us ]
  br i1 %35, label %._crit_edge20.us, label %.lr.ph23.split.us.new.preheader

.lr.ph23.split.us.new.preheader:                  ; preds = %.prol.loopexit61
  br label %.lr.ph23.split.us.new

.lr.ph23.split.us.new:                            ; preds = %.lr.ph23.split.us.new.preheader, %.lr.ph23.split.us.new
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph23.split.us.new ], [ %indvars.iv34.unr.ph, %.lr.ph23.split.us.new.preheader ]
  %43 = phi double [ %57, %.lr.ph23.split.us.new ], [ %.unr64.ph, %.lr.ph23.split.us.new.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv34
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv43
  %47 = load double, double* %46, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next35, i64 %indvars.iv43
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %43, %54
  %57 = fsub double %56, %55
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next35.1, %indvars.iv48
  br i1 %exitcond40.1, label %._crit_edge20.us.loopexit, label %.lr.ph23.split.us.new

._crit_edge20.us.loopexit:                        ; preds = %.lr.ph23.split.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit61
  %.lcssa7 = phi double [ %.lcssa7.unr.ph, %.prol.loopexit61 ], [ %57, %._crit_edge20.us.loopexit ]
  store double %.lcssa7, double* %36, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond47, label %._crit_edge24.loopexit, label %.lr.ph23.split.us

._crit_edge24.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %._crit_edge24._crit_edge
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond50, label %.preheader107, label %._crit_edge24._crit_edge

.preheader107:                                    ; preds = %._crit_edge24
  br label %58

; <label>:58:                                     ; preds = %.preheader107, %._crit_edge8._crit_edge
  %indvars.iv = phi i2 [ %indvars.iv.next, %._crit_edge8._crit_edge ], [ 0, %.preheader107 ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge8._crit_edge ], [ 0, %.preheader107 ]
  %59 = zext i2 %indvars.iv to i64
  %60 = add nsw i64 %indvars.iv17, -1
  %61 = getelementptr inbounds double, double* %1, i64 %indvars.iv17
  %62 = load double, double* %61, align 8
  %63 = icmp sgt i64 %indvars.iv17, 0
  br i1 %63, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %58
  %xtraiter53 = and i64 %indvars.iv17, 3
  %lcmp.mod54 = icmp eq i64 %xtraiter53, 0
  br i1 %lcmp.mod54, label %.prol.loopexit52, label %.prol.preheader51.preheader

.prol.preheader51.preheader:                      ; preds = %.lr.ph7
  br label %.prol.preheader51

.prol.preheader51:                                ; preds = %.prol.preheader51.preheader, %.prol.preheader51..prol.preheader51_crit_edge
  %indvars.iv12.prol = phi i64 [ %indvars.iv.next13.prol, %.prol.preheader51..prol.preheader51_crit_edge ], [ 0, %.prol.preheader51.preheader ]
  %64 = phi double [ %70, %.prol.preheader51..prol.preheader51_crit_edge ], [ %62, %.prol.preheader51.preheader ]
  %prol.iter55 = phi i64 [ %prol.iter55.sub, %.prol.preheader51..prol.preheader51_crit_edge ], [ %xtraiter53, %.prol.preheader51.preheader ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv12.prol
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv12.prol
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %64, %69
  %prol.iter55.sub = add nsw i64 %prol.iter55, -1
  %prol.iter55.cmp = icmp eq i64 %prol.iter55.sub, 0
  br i1 %prol.iter55.cmp, label %.prol.loopexit52.loopexit, label %.prol.preheader51..prol.preheader51_crit_edge, !llvm.loop !1

.prol.preheader51..prol.preheader51_crit_edge:    ; preds = %.prol.preheader51
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  br label %.prol.preheader51

.prol.loopexit52.loopexit:                        ; preds = %.prol.preheader51
  br label %.prol.loopexit52

.prol.loopexit52:                                 ; preds = %.prol.loopexit52.loopexit, %.lr.ph7
  %indvars.iv12.unr = phi i64 [ 0, %.lr.ph7 ], [ %59, %.prol.loopexit52.loopexit ]
  %.unr56 = phi double [ %62, %.lr.ph7 ], [ %70, %.prol.loopexit52.loopexit ]
  %.lcssa3.unr = phi double [ undef, %.lr.ph7 ], [ %70, %.prol.loopexit52.loopexit ]
  %71 = icmp ult i64 %60, 3
  br i1 %71, label %._crit_edge8, label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.prol.loopexit52
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new.preheader, %.lr.ph7.new
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.3, %.lr.ph7.new ], [ %indvars.iv12.unr, %.lr.ph7.new.preheader ]
  %72 = phi double [ %94, %.lr.ph7.new ], [ %.unr56, %.lr.ph7.new.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv12
  %74 = bitcast double* %73 to <2 x double>*
  %75 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  %76 = bitcast double* %75 to <2 x double>*
  %77 = load <2 x double>, <2 x double>* %74, align 8
  %78 = load <2 x double>, <2 x double>* %76, align 8
  %79 = fmul <2 x double> %77, %78
  %80 = extractelement <2 x double> %79, i32 0
  %81 = extractelement <2 x double> %79, i32 1
  %82 = fsub double %72, %80
  %83 = fsub double %82, %81
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv.next13.1
  %85 = bitcast double* %84 to <2 x double>*
  %86 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.1
  %87 = bitcast double* %86 to <2 x double>*
  %88 = load <2 x double>, <2 x double>* %85, align 8
  %89 = load <2 x double>, <2 x double>* %87, align 8
  %90 = fmul <2 x double> %88, %89
  %91 = extractelement <2 x double> %90, i32 0
  %92 = extractelement <2 x double> %90, i32 1
  %93 = fsub double %83, %91
  %94 = fsub double %93, %92
  %indvars.iv.next13.3 = add nuw nsw i64 %indvars.iv12, 4
  %exitcond16.3 = icmp eq i64 %indvars.iv.next13.3, %indvars.iv17
  br i1 %exitcond16.3, label %._crit_edge8.loopexit, label %.lr.ph7.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit52, %58
  %.lcssa1 = phi double [ %62, %58 ], [ %.lcssa3.unr, %.prol.loopexit52 ], [ %94, %._crit_edge8.loopexit ]
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv17
  store double %.lcssa1, double* %95, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond19, label %.preheader.preheader, label %._crit_edge8._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge8
  br label %.preheader

._crit_edge8._crit_edge:                          ; preds = %._crit_edge8
  %indvars.iv.next = add i2 %indvars.iv, 1
  br label %58

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvars.iv81 = phi i2 [ %indvars.iv.next82, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge..preheader_crit_edge ], [ 2000, %.preheader.preheader ]
  %indvar = phi i64 [ %indvar.next, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge..preheader_crit_edge ], [ 1999, %.preheader.preheader ]
  %96 = zext i2 %indvars.iv81 to i64
  %97 = add i64 %indvars.iv79, %96
  %98 = add nsw i64 %indvar, -1
  %99 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  %100 = load double, double* %99, align 8
  %101 = add nuw nsw i64 %indvars.iv10, 1
  %102 = icmp slt i64 %101, 2000
  br i1 %102, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv8.prol = phi i64 [ %indvars.iv.next9.prol, %.prol.preheader..prol.preheader_crit_edge ], [ %indvars.iv79, %.prol.preheader.preheader ]
  %103 = phi double [ %109, %.prol.preheader..prol.preheader_crit_edge ], [ %100, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8.prol
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds double, double* %2, i64 %indvars.iv8.prol
  %107 = load double, double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fsub double %103, %108
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv8.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv8.unr = phi i64 [ %indvars.iv79, %.lr.ph ], [ %97, %.prol.loopexit.loopexit ]
  %.unr = phi double [ %100, %.lr.ph ], [ %109, %.prol.loopexit.loopexit ]
  %.lcssa2.unr = phi double [ undef, %.lr.ph ], [ %109, %.prol.loopexit.loopexit ]
  %110 = icmp ult i64 %98, 3
  br i1 %110, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv8 = phi i64 [ %indvars.iv.next9.3, %.lr.ph.new ], [ %indvars.iv8.unr, %.lr.ph.new.preheader ]
  %111 = phi double [ %133, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv8
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  %115 = bitcast double* %114 to <2 x double>*
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9.1
  %124 = bitcast double* %123 to <2 x double>*
  %125 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = load <2 x double>, <2 x double>* %124, align 8
  %128 = load <2 x double>, <2 x double>* %126, align 8
  %129 = fmul <2 x double> %127, %128
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  %132 = fsub double %122, %130
  %133 = fsub double %132, %131
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv8, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next9.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %.lcssa = phi double [ %100, %.preheader ], [ %.lcssa2.unr, %.prol.loopexit ], [ %133, %._crit_edge.loopexit ]
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv10
  %135 = load double, double* %134, align 8
  %136 = fdiv double %.lcssa, %135
  %137 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double %136, double* %137, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %138, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next82 = add i2 %indvars.iv81, 1
  %indvars.iv.next80 = add nsw i64 %indvars.iv79, -1
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, -1
  br label %.preheader

; <label>:138:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
