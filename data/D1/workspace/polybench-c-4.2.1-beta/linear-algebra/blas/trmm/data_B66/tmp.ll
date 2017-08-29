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
  %14 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge48

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  %10 = sext i32 %0 to i64
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %11 = and i32 %1, 1
  %wide.trip.count19.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge5.us..preheader.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge5.us..preheader.us_crit_edge ]
  %12 = icmp sgt i64 %indvars.iv43, 0
  br i1 %12, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %13 = icmp eq i32 %11, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %14, align 8
  %15 = trunc i64 %indvars.iv43 to i32
  %16 = add i32 %15, %1
  br i1 %13, label %.prol.loopexit32, label %.prol.preheader31

.prol.preheader31:                                ; preds = %._crit_edge.us
  %17 = srem i32 %16, %1
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %._crit_edge.us, %.prol.preheader31
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader31 ], [ 0, %._crit_edge.us ]
  %21 = icmp eq i32 %1, 1
  br i1 %21, label %._crit_edge5.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit32
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %._crit_edge.us.new ], [ %indvars.iv17.unr.ph, %._crit_edge.us.new.preheader ]
  %22 = trunc i64 %indvars.iv17 to i32
  %23 = sub i32 %16, %22
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv17
  store double %26, double* %27, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %28 = trunc i64 %indvars.iv.next18 to i32
  %29 = sub i32 %16, %28
  %30 = srem i32 %29, %1
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv.next18
  store double %32, double* %33, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond20.1, label %._crit_edge5.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %34 = add nsw i64 %indvars.iv, %indvars.iv43
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, %0
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %9
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = add nsw i64 %indvars.iv.next, %indvars.iv43
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %9
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv.next
  store double %44, double* %45, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %46 = trunc i64 %indvars.iv43 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, %9
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %49, double* %50, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %51 = icmp eq i32 %indvar, 1
  br i1 %51, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.prol.loopexit32
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %10
  br i1 %exitcond, label %._crit_edge48.loopexit, label %._crit_edge5.us..preheader.us_crit_edge

._crit_edge5.us..preheader.us_crit_edge:          ; preds = %._crit_edge5.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvar37 = phi i32 [ %indvar.next38, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %52 = icmp sgt i64 %indvars.iv45, 0
  br i1 %52, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter39 = and i32 %indvar37, 1
  %lcmp.mod40 = icmp eq i32 %xtraiter39, 0
  br i1 %lcmp.mod40, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.lr.ph
  %53 = trunc i64 %indvars.iv45 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 0
  store double %56, double* %57, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.lr.ph, %.prol.preheader35
  %indvars.iv23.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.lr.ph ]
  %58 = icmp eq i32 %indvar37, 1
  br i1 %58, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit36
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %.lr.ph.new ], [ %indvars.iv23.unr.ph, %.lr.ph.new.preheader ]
  %59 = add nsw i64 %indvars.iv23, %indvars.iv45
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, %0
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %9
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv23
  store double %63, double* %64, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %65 = add nsw i64 %indvars.iv.next24, %indvars.iv45
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, %0
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %68, %9
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv.next24
  store double %69, double* %70, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv45
  br i1 %exitcond28.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit36, %.preheader
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %71, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond47, label %._crit_edge48.loopexit50, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvar.next38 = add nuw nsw i32 %indvar37, 1
  br label %.preheader

._crit_edge48.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge48

._crit_edge48.loopexit50:                         ; preds = %._crit_edge
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit50, %._crit_edge48.loopexit, %5
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
  %9 = sext i32 %0 to i64
  %10 = add i32 %0, 1
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvar = phi i32 [ 0, %.preheader3.us.preheader ], [ %indvar.next, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv31 = phi i64 [ 0, %.preheader3.us.preheader ], [ %12, %._crit_edge6.us..preheader3.us_crit_edge ]
  %indvars.iv = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv.next21.prol, %._crit_edge6.us..preheader3.us_crit_edge ]
  %11 = sub i32 %10, %indvar
  %12 = add nuw nsw i64 %indvars.iv31, 1
  %xtraiter = and i32 %11, 1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv31
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv26 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next27, %._crit_edge.us ]
  %14 = icmp slt i64 %12, %9
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv26
  br i1 %14, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %2
  store double %17, double* %15, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond30, label %._crit_edge6.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.prol.loopexit..lr.ph.us.new_crit_edge
  %18 = phi double [ %.pre, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %30, %.lr.ph.us.new ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr.ph, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %indvars.iv.next21.1, %.lr.ph.us.new ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv31
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv26
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %23, %18
  store double %24, double* %15, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next21, i64 %indvars.iv31
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next21, i64 %indvars.iv26
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %29, %24
  store double %30, double* %15, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next21.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %31 = icmp eq i32 %xtraiter, 0
  br i1 %31, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = load double, double* %13, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv26
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %15, align 8
  %37 = fadd double %35, %36
  store double %37, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv20.unr.ph = phi i64 [ %indvars.iv.next21.prol, %.prol.preheader ], [ %indvars.iv, %.lr.ph.us ]
  %38 = icmp eq i32 %8, %indvar
  br i1 %38, label %._crit_edge.us, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %.pre = load double, double* %15, align 8
  br label %.lr.ph.us.new

._crit_edge6.us:                                  ; preds = %._crit_edge.us
  %exitcond = icmp eq i64 %12, %9
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge6.us..preheader3.us_crit_edge

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
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge12, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge12 ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge12

; <label>:16:                                     ; preds = %._crit_edge13
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge13, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13

._crit_edge.us:                                   ; preds = %._crit_edge12
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, %10
  br i1 %exitcond11, label %._crit_edge.loopexit, label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
