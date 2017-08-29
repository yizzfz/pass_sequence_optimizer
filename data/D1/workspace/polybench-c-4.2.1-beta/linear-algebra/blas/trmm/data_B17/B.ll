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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph7, label %._crit_edge50

.lr.ph7:                                          ; preds = %5
  %wide.trip.count19.1 = zext i32 %1 to i64
  %7 = sext i32 %0 to i64
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph7.split.us.preheader, label %.lr.ph7.split.preheader

.lr.ph7.split.preheader:                          ; preds = %.lr.ph7
  br label %.lr.ph7.split

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph7
  %xtraiter22 = and i32 %1, 1
  %11 = icmp eq i32 %xtraiter22, 0
  %12 = icmp eq i32 %1, 1
  br label %.lr.ph7.split.us

.lr.ph7.split.us:                                 ; preds = %._crit_edge3.us..lr.ph7.split.us_crit_edge, %.lr.ph7.split.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.lr.ph7.split.us.preheader ], [ %indvars.iv.next46, %._crit_edge3.us..lr.ph7.split.us_crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph7.split.us.preheader ], [ %indvar.next, %._crit_edge3.us..lr.ph7.split.us_crit_edge ]
  %13 = icmp sgt i64 %indvars.iv45, 0
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.lr.ph7.split.us
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %14, align 8
  %15 = trunc i64 %indvars.iv45 to i32
  %16 = add i32 %15, %1
  br i1 %11, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %._crit_edge.us
  %17 = srem i32 %16, %1
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %._crit_edge.us, %.prol.preheader20
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %._crit_edge.us ]
  br i1 %12, label %._crit_edge3.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit21
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %._crit_edge.us.new ], [ %indvars.iv17.unr.ph, %._crit_edge.us.new.preheader ]
  %21 = trunc i64 %indvars.iv17 to i32
  %22 = sub i32 %16, %21
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv17
  store double %25, double* %26, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %27 = trunc i64 %indvars.iv.next18 to i32
  %28 = sub i32 %16, %27
  %29 = srem i32 %28, %1
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next18
  store double %31, double* %32, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.125 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond.125, label %._crit_edge3.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %33 = add nsw i64 %indvars.iv, %indvars.iv45
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %9
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = add nsw i64 %indvars.iv.next, %indvars.iv45
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %9
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv45
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.lr.ph7.split.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %45 = trunc i64 %indvars.iv45 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %9
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 0
  store double %48, double* %49, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %50 = icmp eq i32 %indvar, 1
  br i1 %50, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge3.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit, %.prol.loopexit21
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %7
  br i1 %exitcond, label %._crit_edge50.loopexit, label %._crit_edge3.us..lr.ph7.split.us_crit_edge

._crit_edge3.us..lr.ph7.split.us_crit_edge:       ; preds = %._crit_edge3.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.lr.ph7.split.us

.lr.ph7.split:                                    ; preds = %.lr.ph7.split.preheader, %._crit_edge..lr.ph7.split_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge..lr.ph7.split_crit_edge ], [ 0, %.lr.ph7.split.preheader ]
  %indvar35 = phi i32 [ %indvar.next36, %._crit_edge..lr.ph7.split_crit_edge ], [ 0, %.lr.ph7.split.preheader ]
  %51 = icmp sgt i64 %indvars.iv47, 0
  br i1 %51, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph7.split
  %xtraiter37 = and i32 %indvar35, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.lr.ph
  %52 = trunc i64 %indvars.iv47 to i32
  %53 = srem i32 %52, %0
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %9
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 0
  store double %55, double* %56, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.lr.ph, %.prol.preheader33
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader33 ], [ 0, %.lr.ph ]
  %57 = icmp eq i32 %indvar35, 1
  br i1 %57, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit34
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph.new ], [ %indvars.iv28.unr.ph, %.lr.ph.new.preheader ]
  %58 = add nsw i64 %indvars.iv28, %indvars.iv47
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %9
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv28
  store double %62, double* %63, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %64 = add nsw i64 %indvars.iv.next29, %indvars.iv47
  %65 = trunc i64 %64 to i32
  %66 = srem i32 %65, %0
  %67 = sitofp i32 %66 to double
  %68 = fdiv double %67, %9
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv.next29
  store double %68, double* %69, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv47
  br i1 %exitcond.140, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit34, %.lr.ph7.split
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %70, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, %7
  br i1 %exitcond49, label %._crit_edge50.loopexit52, label %._crit_edge..lr.ph7.split_crit_edge

._crit_edge..lr.ph7.split_crit_edge:              ; preds = %._crit_edge
  %indvar.next36 = add nuw nsw i32 %indvar35, 1
  br label %.lr.ph7.split

._crit_edge50.loopexit:                           ; preds = %._crit_edge3.us
  br label %._crit_edge50

._crit_edge50.loopexit52:                         ; preds = %._crit_edge
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit52, %._crit_edge50.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph9, label %._crit_edge

.lr.ph9:                                          ; preds = %5
  %wide.trip.count22 = zext i32 %1 to i64
  %wide.trip.count.1 = sext i32 %0 to i64
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.lr.ph9.split.us.preheader, label %._crit_edge

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  %8 = add i32 %0, -1
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge4.us, %.lr.ph9.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph9.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge4.us ]
  %9 = phi i32 [ 0, %.lr.ph9.split.us.preheader ], [ %10, %._crit_edge4.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %10 = add nuw nsw i32 %9, 1
  %11 = trunc i64 %indvars.iv.next24 to i32
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph9.split.us
  %indvars.iv20 = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next21, %._crit_edge.us ]
  %12 = phi i32 [ %11, %.lr.ph9.split.us ], [ %10, %._crit_edge.us ]
  %13 = icmp slt i32 %12, %0
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv20
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %._crit_edge.us._crit_edge
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  store double %16, double* %14, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond, label %._crit_edge4.us, label %._crit_edge.us._crit_edge

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %17 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %29, %.lr.ph.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv23
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv20
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %22, %17
  store double %23, double* %14, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv20
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %28, %23
  store double %29, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge.us._crit_edge
  %30 = sext i32 %12 to i64
  %31 = sub i32 %0, %12
  %xtraiter = and i32 %31, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %30, i64 %indvars.iv23
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %30, i64 %indvars.iv20
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %14, align 8
  %38 = fadd double %36, %37
  store double %38, double* %14, align 8
  %indvars.iv.next.prol = add nsw i64 %30, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ %30, %.lr.ph.us ]
  %39 = icmp eq i32 %8, %12
  br i1 %39, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %14, align 8
  br label %.lr.ph.us.new

._crit_edge4.us:                                  ; preds = %._crit_edge.us
  %exitcond27 = icmp eq i64 %indvars.iv.next24, %wide.trip.count.1
  br i1 %exitcond27, label %._crit_edge.loopexit, label %.lr.ph9.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge4.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph9, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph3, label %._crit_edge

.lr.ph3:                                          ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph3.split.us.preheader, label %._crit_edge

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %11 = mul nsw i64 %9, %indvars.iv10
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge14 ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge14

; <label>:16:                                     ; preds = %._crit_edge15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %9
  br i1 %exitcond13, label %._crit_edge.loopexit, label %.lr.ph3.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph3, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
