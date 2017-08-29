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
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge52

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  %10 = sext i32 %0 to i64
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %11 = insertelement <2 x double> undef, double %9, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter22 = and i32 %1, 1
  %wide.trip.count19.1 = zext i32 %1 to i64
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = icmp eq i32 %xtraiter22, 0
  %16 = icmp eq i32 %1, 1
  %17 = insertelement <2 x double> undef, double %8, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge5.us..preheader.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge5.us..preheader.us_crit_edge ]
  %19 = icmp sgt i64 %indvars.iv45, 0
  br i1 %19, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %20, align 8
  %21 = trunc i64 %indvars.iv45 to i32
  %22 = add i32 %21, %1
  br i1 %15, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %._crit_edge.us
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 0
  store double %25, double* %26, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %._crit_edge.us, %.prol.preheader20
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %._crit_edge.us ]
  br i1 %16, label %._crit_edge5.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit21
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %._crit_edge.us.new ], [ %indvars.iv17.unr.ph, %._crit_edge.us.new.preheader ]
  %27 = trunc i64 %indvars.iv17 to i32
  %28 = sub i32 %22, %27
  %29 = srem i32 %28, %1
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv17
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %32 = trunc i64 %indvars.iv.next18 to i32
  %33 = sub i32 %22, %32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %30, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fdiv <2 x double> %37, %18
  %39 = bitcast double* %31 to <2 x double>*
  store <2 x double> %38, <2 x double>* %39, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.125 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond.125, label %._crit_edge5.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %40 = add nsw i64 %indvars.iv, %indvars.iv45
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = add nsw i64 %indvars.iv.next, %indvars.iv45
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = insertelement <2 x double> undef, double %43, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fdiv <2 x double> %50, %14
  %52 = bitcast double* %44 to <2 x double>*
  store <2 x double> %51, <2 x double>* %52, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv45
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %53 = trunc i64 %indvars.iv45 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %58 = icmp eq i32 %indvar, 1
  br i1 %58, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.prol.loopexit21
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond, label %._crit_edge52.loopexit, label %._crit_edge5.us..preheader.us_crit_edge

._crit_edge5.us..preheader.us_crit_edge:          ; preds = %._crit_edge5.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvar35 = phi i32 [ %indvar.next36, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %59 = icmp sgt i64 %indvars.iv47, 0
  br i1 %59, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter37 = and i32 %indvar35, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.lr.ph
  %60 = trunc i64 %indvars.iv47 to i32
  %61 = srem i32 %60, %0
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %9
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 0
  store double %63, double* %64, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.lr.ph, %.prol.preheader33
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader33 ], [ 0, %.lr.ph ]
  %65 = icmp eq i32 %indvar35, 1
  br i1 %65, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit34
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph.new ], [ %indvars.iv28.unr.ph, %.lr.ph.new.preheader ]
  %66 = add nsw i64 %indvars.iv28, %indvars.iv47
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, %0
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv28
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %71 = add nsw i64 %indvars.iv.next29, %indvars.iv47
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, %0
  %74 = sitofp i32 %73 to double
  %75 = insertelement <2 x double> undef, double %69, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fdiv <2 x double> %76, %12
  %78 = bitcast double* %70 to <2 x double>*
  store <2 x double> %77, <2 x double>* %78, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv47
  br i1 %exitcond.140, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit34, %.preheader
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %79, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, %10
  br i1 %exitcond49, label %._crit_edge52.loopexit53, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvar.next36 = add nuw nsw i32 %indvar35, 1
  br label %.preheader

._crit_edge52.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge52

._crit_edge52.loopexit53:                         ; preds = %._crit_edge
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge52.loopexit53, %._crit_edge52.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %0, -2
  %9 = add i32 %0, 1
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader3.us.preheader ], [ %12, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader3.us.preheader ], [ %indvar.next, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv22.in = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv22, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv22 = add nuw nsw i64 %indvars.iv22.in, 1
  %11 = sub i32 %9, %indvar
  %12 = add nuw nsw i64 %indvars.iv30, 1
  %xtraiter = and i32 %11, 1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22.in, i64 %indvars.iv30
  %14 = icmp slt i64 %12, %10
  %15 = icmp eq i32 %xtraiter, 0
  %16 = icmp eq i32 %8, %indvar
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv26 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next27, %._crit_edge.us ]
  br i1 %14, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  %.pre34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv26
  br label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us.._crit_edge.us_crit_edge
  %.pre-phi = phi double* [ %.pre34, %.preheader.us.._crit_edge.us_crit_edge ], [ %32, %.prol.loopexit ], [ %32, %._crit_edge.us.loopexit ]
  %17 = load double, double* %.pre-phi, align 8
  %18 = fmul double %17, %2
  store double %18, double* %.pre-phi, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %19 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %31, %.lr.ph.us.new ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next21.1, %.lr.ph.us.new ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv30
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv26
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %24, %19
  store double %25, double* %32, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next21, i64 %indvars.iv30
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next21, i64 %indvars.iv26
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %30, %25
  store double %31, double* %32, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next21.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv26
  br i1 %15, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %33 = load double, double* %13, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22.in, i64 %indvars.iv26
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %32, align 8
  %38 = fadd double %36, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv20.unr.ph = phi i64 [ %indvars.iv22, %.prol.preheader ], [ %indvars.iv22.in, %.lr.ph.us ]
  br i1 %16, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %32, align 8
  br label %.lr.ph.us.new

._crit_edge6.us:                                  ; preds = %._crit_edge.us
  %exitcond35 = icmp eq i64 %12, %10
  br i1 %exitcond35, label %._crit_edge.loopexit, label %._crit_edge6.us..preheader3.us_crit_edge

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader3.us

._crit_edge.loopexit:                             ; preds = %._crit_edge6.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %11 = mul nsw i64 %10, %indvars.iv9
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge15

; <label>:16:                                     ; preds = %._crit_edge16
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge16, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge15
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %10
  br i1 %exitcond12, label %._crit_edge.loopexit, label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
