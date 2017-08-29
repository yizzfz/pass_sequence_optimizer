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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(double* %16)
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
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41, %4
  %indvars.iv34 = phi i64 [ 0, %4 ], [ %indvars.iv.next35.1, %._crit_edge41 ]
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
  br i1 %exitcond36.1, label %.lr.ph.preheader, label %._crit_edge41

.lr.ph.preheader:                                 ; preds = %._crit_edge41
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv29.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %21 = mul i64 %indvars.iv31, 2001
  %22 = add i64 %21, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %22
  %23 = mul i64 %indvars.iv31, -8
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42, %.lr.ph
  %indvars.iv19 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next20, %._crit_edge42 ]
  %24 = sub nsw i64 0, %indvars.iv19
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 2.000000e+03
  %29 = fadd double %28, 1.000000e+00
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv19
  store double %29, double* %30, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %indvars.iv29
  br i1 %exitcond23, label %._crit_edge, label %._crit_edge42

._crit_edge:                                      ; preds = %._crit_edge42
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %31 = icmp slt i64 %indvars.iv.next32, 2000
  br i1 %31, label %._crit_edge10.thread, label %._crit_edge10

._crit_edge10.thread:                             ; preds = %._crit_edge
  %32 = add i64 %23, 15992
  %scevgep38 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep38, i8 0, i64 %32, i32 8, i1 false)
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %33, align 8
  br label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge10, %._crit_edge10.thread
  %indvars.iv29.be = add nuw nsw i64 %indvars.iv29, 1
  br label %.lr.ph

._crit_edge10:                                    ; preds = %._crit_edge
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %34, align 8
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond33, label %.preheader3.preheader, label %.lr.ph.backedge

.preheader3.preheader:                            ; preds = %._crit_edge10
  %35 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %35, i8 0, i64 32000000, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %53, %.preheader3.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next11, %53 ]
  br label %.preheader2

.preheader2:                                      ; preds = %52, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8, %52 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv10
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43, %.preheader2
  %indvars.iv4 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next5.1, %._crit_edge43 ]
  %37 = bitcast i8* %35 to [2000 x [2000 x double]]*
  %38 = load double, double* %36, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv10
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %45 = load double, double* %36, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv10
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %52, label %._crit_edge43

; <label>:52:                                     ; preds = %._crit_edge43
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %53, label %.preheader2

; <label>:53:                                     ; preds = %52
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader3

.preheader.preheader:                             ; preds = %53
  br label %.preheader

.preheader:                                       ; preds = %80, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %80 ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %._crit_edge44 ]
  %54 = bitcast i8* %35 to [2000 x [2000 x double]]*
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv1, i64 %indvars.iv
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.2
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next.3
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %80, label %._crit_edge44

; <label>:80:                                     ; preds = %._crit_edge44
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %81, label %.preheader

; <label>:81:                                     ; preds = %80
  tail call void @free(i8* nonnull %35) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge22, %4
  %indvars.iv35 = phi i64 [ 0, %4 ], [ %indvars.iv.next36, %._crit_edge22 ]
  %5 = icmp sgt i64 %indvars.iv35, 0
  br i1 %5, label %.preheader3..lr.ph16_crit_edge, label %._crit_edge22

.preheader3..lr.ph16_crit_edge:                   ; preds = %.preheader3
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 0
  br label %.lr.ph16

.lr.ph21:                                         ; preds = %._crit_edge14
  %7 = icmp sgt i64 %indvars.iv35, 0
  br i1 %7, label %.lr.ph21..lr.ph21.split.us_crit_edge, label %._crit_edge22

.lr.ph21..lr.ph21.split.us_crit_edge:             ; preds = %.lr.ph21
  %xtraiter45 = and i64 %indvars.iv35, 1
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 0
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %._crit_edge19.us, %.lr.ph21..lr.ph21.split.us_crit_edge
  %indvars.iv32 = phi i64 [ %indvars.iv35, %.lr.ph21..lr.ph21.split.us_crit_edge ], [ %indvars.iv.next33, %._crit_edge19.us ]
  %9 = icmp eq i64 %xtraiter45, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv32
  %11 = load double, double* %10, align 8
  br i1 %9, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph21.split.us
  %12 = load double, double* %8, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv32
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph21.split.us, %.prol.preheader
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph21.split.us ]
  %.unr47.ph = phi double [ %16, %.prol.preheader ], [ %11, %.lr.ph21.split.us ]
  %.lcssa27.unr.ph = phi double [ %16, %.prol.preheader ], [ undef, %.lr.ph21.split.us ]
  %17 = icmp eq i64 %indvars.iv35, 1
  br i1 %17, label %._crit_edge19.us, label %.lr.ph21.split.us.new.preheader

.lr.ph21.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph21.split.us.new

.lr.ph21.split.us.new:                            ; preds = %.lr.ph21.split.us.new, %.lr.ph21.split.us.new.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph21.split.us.new.preheader ], [ %indvars.iv.next26.1, %.lr.ph21.split.us.new ]
  %18 = phi double [ %.unr47.ph, %.lr.ph21.split.us.new.preheader ], [ %32, %.lr.ph21.split.us.new ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv25
  %20 = bitcast double* %19 to <2 x double>*
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv32
  %22 = load double, double* %21, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %23 = load <2 x double>, <2 x double>* %20, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next26, i64 %indvars.iv32
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %22, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %23, %27
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %31 = fsub double %18, %29
  %32 = fsub double %31, %30
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv35
  br i1 %exitcond29.1, label %._crit_edge19.us.loopexit, label %.lr.ph21.split.us.new

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph21.split.us.new
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.prol.loopexit
  %.lcssa27 = phi double [ %.lcssa27.unr.ph, %.prol.loopexit ], [ %32, %._crit_edge19.us.loopexit ]
  store double %.lcssa27, double* %10, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond34, label %._crit_edge22.loopexit, label %.lr.ph21.split.us

.lr.ph16:                                         ; preds = %._crit_edge14, %.preheader3..lr.ph16_crit_edge
  %indvars.iv18 = phi i64 [ 0, %.preheader3..lr.ph16_crit_edge ], [ %indvars.iv.next19, %._crit_edge14 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv18
  %34 = load double, double* %33, align 8
  %35 = icmp sgt i64 %indvars.iv18, 0
  br i1 %35, label %.lr.ph13.preheader, label %._crit_edge14

.lr.ph13.preheader:                               ; preds = %.lr.ph16
  %xtraiter42 = and i64 %indvars.iv18, 1
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.preheader
  %36 = load double, double* %6, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv18
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %34, %39
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.preheader, %.lr.ph13.prol
  %indvars.iv13.unr.ph = phi i64 [ 1, %.lr.ph13.prol ], [ 0, %.lr.ph13.preheader ]
  %.unr44.ph = phi double [ %40, %.lr.ph13.prol ], [ %34, %.lr.ph13.preheader ]
  %.lcssa26.unr.ph = phi double [ %40, %.lr.ph13.prol ], [ undef, %.lr.ph13.preheader ]
  %41 = icmp eq i64 %indvars.iv18, 1
  br i1 %41, label %._crit_edge14, label %.lr.ph13.preheader87

.lr.ph13.preheader87:                             ; preds = %.lr.ph13.prol.loopexit
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader87
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr.ph, %.lr.ph13.preheader87 ], [ %indvars.iv.next14.1, %.lr.ph13 ]
  %42 = phi double [ %.unr44.ph, %.lr.ph13.preheader87 ], [ %56, %.lr.ph13 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv13
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv18
  %46 = load double, double* %45, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next14, i64 %indvars.iv18
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %42, %53
  %56 = fsub double %55, %54
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next14.1, %indvars.iv18
  br i1 %exitcond17.1, label %._crit_edge14.loopexit, label %.lr.ph13

._crit_edge14.loopexit:                           ; preds = %.lr.ph13
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.lr.ph13.prol.loopexit, %.lr.ph16
  %.lcssa5 = phi double [ %34, %.lr.ph16 ], [ %.lcssa26.unr.ph, %.lr.ph13.prol.loopexit ], [ %56, %._crit_edge14.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv18
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.lcssa5, %58
  store double %59, double* %33, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next19, %indvars.iv35
  br i1 %exitcond23, label %.lr.ph21, label %.lr.ph16

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph21, %.preheader3
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 2000
  br i1 %exitcond37, label %.preheader1.preheader, label %.preheader3

.preheader1.preheader:                            ; preds = %._crit_edge22
  br label %.preheader1

.preheader1:                                      ; preds = %._crit_edge10, %.preheader1.preheader
  %indvars.iv = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next, %._crit_edge10 ]
  %indvars.iv10 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next11, %._crit_edge10 ]
  %60 = and i64 %indvars.iv, 3
  %61 = add nsw i64 %indvars.iv10, -1
  %62 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %63 = load double, double* %62, align 8
  %64 = icmp sgt i64 %indvars.iv10, 0
  br i1 %64, label %.lr.ph9.preheader, label %._crit_edge10

.lr.ph9.preheader:                                ; preds = %.preheader1
  %xtraiter38 = and i64 %indvars.iv10, 3
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.lr.ph9.prol.loopexit, label %.lr.ph9.prol.preheader

.lr.ph9.prol.preheader:                           ; preds = %.lr.ph9.preheader
  br label %.lr.ph9.prol

.lr.ph9.prol:                                     ; preds = %.lr.ph9.prol, %.lr.ph9.prol.preheader
  %indvars.iv5.prol = phi i64 [ 0, %.lr.ph9.prol.preheader ], [ %indvars.iv.next6.prol, %.lr.ph9.prol ]
  %65 = phi double [ %63, %.lr.ph9.prol.preheader ], [ %71, %.lr.ph9.prol ]
  %prol.iter40 = phi i64 [ %xtraiter38, %.lr.ph9.prol.preheader ], [ %prol.iter40.sub, %.lr.ph9.prol ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv5.prol
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv5.prol
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fsub double %65, %70
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv5.prol, 1
  %prol.iter40.sub = add nsw i64 %prol.iter40, -1
  %prol.iter40.cmp = icmp eq i64 %prol.iter40.sub, 0
  br i1 %prol.iter40.cmp, label %.lr.ph9.prol.loopexit.loopexit, label %.lr.ph9.prol, !llvm.loop !1

.lr.ph9.prol.loopexit.loopexit:                   ; preds = %.lr.ph9.prol
  br label %.lr.ph9.prol.loopexit

.lr.ph9.prol.loopexit:                            ; preds = %.lr.ph9.prol.loopexit.loopexit, %.lr.ph9.preheader
  %indvars.iv5.unr = phi i64 [ 0, %.lr.ph9.preheader ], [ %60, %.lr.ph9.prol.loopexit.loopexit ]
  %.unr41 = phi double [ %63, %.lr.ph9.preheader ], [ %71, %.lr.ph9.prol.loopexit.loopexit ]
  %.lcssa25.unr = phi double [ undef, %.lr.ph9.preheader ], [ %71, %.lr.ph9.prol.loopexit.loopexit ]
  %72 = icmp ult i64 %61, 3
  br i1 %72, label %._crit_edge10, label %.lr.ph9.preheader86

.lr.ph9.preheader86:                              ; preds = %.lr.ph9.prol.loopexit
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9, %.lr.ph9.preheader86
  %indvars.iv5 = phi i64 [ %indvars.iv5.unr, %.lr.ph9.preheader86 ], [ %indvars.iv.next6.3, %.lr.ph9 ]
  %73 = phi double [ %.unr41, %.lr.ph9.preheader86 ], [ %95, %.lr.ph9 ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv5
  %75 = bitcast double* %74 to <2 x double>*
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  %77 = bitcast double* %76 to <2 x double>*
  %78 = load <2 x double>, <2 x double>* %75, align 8
  %79 = load <2 x double>, <2 x double>* %77, align 8
  %80 = fmul <2 x double> %78, %79
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = fsub double %73, %81
  %84 = fsub double %83, %82
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next6.1
  %86 = bitcast double* %85 to <2 x double>*
  %87 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.1
  %88 = bitcast double* %87 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %86, align 8
  %90 = load <2 x double>, <2 x double>* %88, align 8
  %91 = fmul <2 x double> %89, %90
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fsub double %84, %92
  %95 = fsub double %94, %93
  %indvars.iv.next6.3 = add nuw nsw i64 %indvars.iv5, 4
  %exitcond9.3 = icmp eq i64 %indvars.iv.next6.3, %indvars.iv10
  br i1 %exitcond9.3, label %._crit_edge10.loopexit, label %.lr.ph9

._crit_edge10.loopexit:                           ; preds = %.lr.ph9
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.lr.ph9.prol.loopexit, %.preheader1
  %.lcssa4 = phi double [ %63, %.preheader1 ], [ %.lcssa25.unr, %.lr.ph9.prol.loopexit ], [ %95, %._crit_edge10.loopexit ]
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %.lcssa4, double* %96, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  %indvars.iv.next = add nuw nsw i64 %60, 1
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %._crit_edge10
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv77 = phi i2 [ 0, %.preheader.preheader ], [ %indvars.iv.next78, %._crit_edge ]
  %indvars.iv75 = phi i64 [ 2000, %.preheader.preheader ], [ %indvars.iv.next76, %._crit_edge ]
  %indvar = phi i64 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv3 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next4, %._crit_edge ]
  %97 = phi i32 [ 1999, %.preheader.preheader ], [ %139, %._crit_edge ]
  %.in7 = phi i32 [ 2000, %.preheader.preheader ], [ %97, %._crit_edge ]
  %98 = zext i2 %indvars.iv77 to i64
  %99 = add i64 %indvars.iv75, %98
  %100 = add nsw i64 %indvar, -1
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv3
  %102 = load double, double* %101, align 8
  %103 = icmp slt i32 %.in7, 2000
  br i1 %103, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv1.prol = phi i64 [ %indvars.iv75, %.lr.ph.prol.preheader ], [ %indvars.iv.next2.prol, %.lr.ph.prol ]
  %104 = phi double [ %102, %.lr.ph.prol.preheader ], [ %110, %.lr.ph.prol ]
  %prol.iter = phi i64 [ %xtraiter, %.lr.ph.prol.preheader ], [ %prol.iter.sub, %.lr.ph.prol ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv1.prol
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %2, i64 %indvars.iv1.prol
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %104, %109
  %indvars.iv.next2.prol = add nuw nsw i64 %indvars.iv1.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv1.unr = phi i64 [ %indvars.iv75, %.lr.ph.preheader ], [ %99, %.lr.ph.prol.loopexit.loopexit ]
  %.unr = phi double [ %102, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa24.unr = phi double [ undef, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %111 = icmp ult i64 %100, 3
  br i1 %111, label %._crit_edge, label %.lr.ph.preheader85

.lr.ph.preheader85:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader85
  %indvars.iv1 = phi i64 [ %indvars.iv1.unr, %.lr.ph.preheader85 ], [ %indvars.iv.next2.3, %.lr.ph ]
  %112 = phi double [ %.unr, %.lr.ph.preheader85 ], [ %134, %.lr.ph ]
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv1
  %114 = bitcast double* %113 to <2 x double>*
  %115 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  %116 = bitcast double* %115 to <2 x double>*
  %117 = load <2 x double>, <2 x double>* %114, align 8
  %118 = load <2 x double>, <2 x double>* %116, align 8
  %119 = fmul <2 x double> %117, %118
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fsub double %112, %120
  %123 = fsub double %122, %121
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, 2
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next2.1
  %125 = bitcast double* %124 to <2 x double>*
  %126 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2.1
  %127 = bitcast double* %126 to <2 x double>*
  %128 = load <2 x double>, <2 x double>* %125, align 8
  %129 = load <2 x double>, <2 x double>* %127, align 8
  %130 = fmul <2 x double> %128, %129
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  %133 = fsub double %123, %131
  %134 = fsub double %133, %132
  %indvars.iv.next2.3 = add nsw i64 %indvars.iv1, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next2.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.lcssa = phi double [ %102, %.preheader ], [ %.lcssa24.unr, %.lr.ph.prol.loopexit ], [ %134, %._crit_edge.loopexit ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv3
  %136 = load double, double* %135, align 8
  %137 = fdiv double %.lcssa, %136
  %138 = getelementptr inbounds double, double* %2, i64 %indvars.iv3
  store double %137, double* %138, align 8
  %indvars.iv.next4 = add nsw i64 %indvars.iv3, -1
  %139 = add nsw i32 %97, -1
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, -1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %indvars.iv.next78 = add i2 %indvars.iv77, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %140, label %.preheader

; <label>:140:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
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
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
