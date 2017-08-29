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
  %.cast = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %.cast)
  call void (...) @polybench_timer_start() #4
  %7 = load double, double* %3, align 8
  %8 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %7, [1000 x double]* %6, [1200 x double]* %8)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
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
  br i1 true, label %.preheader.lr.ph, label %._crit_edge50

.preheader.lr.ph:                                 ; preds = %5
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge5.us..preheader.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge5.us..preheader.us_crit_edge ]
  %6 = icmp sgt i64 %indvars.iv45, 0
  br i1 %6, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv45
  store double 1.000000e+00, double* %7, align 8
  %8 = trunc i64 %indvars.iv45 to i32
  %9 = add i32 %8, 1200
  br i1 true, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %._crit_edge.us
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %._crit_edge.us, %.prol.preheader20
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %._crit_edge.us ]
  br i1 false, label %._crit_edge5.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit21
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %._crit_edge.us.new ], [ %indvars.iv17.unr.ph, %._crit_edge.us.new.preheader ]
  %14 = trunc i64 %indvars.iv17 to i32
  %15 = sub i32 %9, %14
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.200000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv17
  store double %18, double* %19, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %20 = trunc i64 %indvars.iv.next18 to i32
  %21 = sub i32 %9, %20
  %22 = srem i32 %21, 1200
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next18
  store double %24, double* %25, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.125 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.125, label %._crit_edge5.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %26 = add nsw i64 %indvars.iv, %indvars.iv45
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = add nsw i64 %indvars.iv.next, %indvars.iv45
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1000
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.000000e+03
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %36, double* %37, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv45
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %38 = trunc i64 %indvars.iv45 to i32
  %39 = srem i32 %38, 1000
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.000000e+03
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 0
  store double %41, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %43 = icmp eq i32 %indvar, 1
  br i1 %43, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.prol.loopexit21
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond, label %._crit_edge50.loopexit, label %._crit_edge5.us..preheader.us_crit_edge

._crit_edge5.us..preheader.us_crit_edge:          ; preds = %._crit_edge5.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvar35 = phi i32 [ %indvar.next36, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %44 = icmp sgt i64 %indvars.iv47, 0
  br i1 %44, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter37 = and i32 %indvar35, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.lr.ph
  %45 = trunc i64 %indvars.iv47 to i32
  %46 = srem i32 %45, 1000
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, 1.000000e+03
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 0
  store double %48, double* %49, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.lr.ph, %.prol.preheader33
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader33 ], [ 0, %.lr.ph ]
  %50 = icmp eq i32 %indvar35, 1
  br i1 %50, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit34
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph.new ], [ %indvars.iv28.unr.ph, %.lr.ph.new.preheader ]
  %51 = add nsw i64 %indvars.iv28, %indvars.iv47
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 1000
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, 1.000000e+03
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv28
  store double %55, double* %56, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %57 = add nsw i64 %indvars.iv.next29, %indvars.iv47
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 1000
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, 1.000000e+03
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv.next29
  store double %61, double* %62, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next29.1, %indvars.iv47
  br i1 %exitcond.140, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit34, %.preheader
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %63, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 1000
  br i1 %exitcond49, label %._crit_edge50.loopexit51, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvar.next36 = add nuw nsw i32 %indvar35, 1
  br label %.preheader

._crit_edge50.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge50

._crit_edge50.loopexit51:                         ; preds = %._crit_edge
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit51, %._crit_edge50.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader3.us.preheader, label %._crit_edge

.preheader3.us.preheader:                         ; preds = %5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %..loopexit_crit_edge.us, %.preheader3.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next22, %..loopexit_crit_edge.us ]
  %6 = phi i32 [ 0, %.preheader3.us.preheader ], [ %7, %..loopexit_crit_edge.us ]
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %7 = add nuw nsw i32 %6, 1
  %8 = trunc i64 %indvars.iv.next22 to i32
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv18 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next19, %._crit_edge.us ]
  %9 = phi i32 [ %8, %.preheader3.us ], [ %7, %._crit_edge.us ]
  %10 = icmp slt i32 %9, 1000
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv18
  br i1 %10, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %2
  store double %13, double* %11, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %14 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %26, %.lr.ph.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv21
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv18
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %19, %14
  store double %20, double* %11, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv21
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv18
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %20
  store double %26, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %27 = sext i32 %9 to i64
  %28 = sub i32 1000, %9
  %xtraiter = and i32 %28, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %27, i64 %indvars.iv21
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %27, i64 %indvars.iv18
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %11, align 8
  %35 = fadd double %33, %34
  store double %35, double* %11, align 8
  %indvars.iv.next.prol = add nsw i64 %27, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ %27, %.lr.ph.us ]
  %36 = icmp eq i32 999, %9
  br i1 %36, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %11, align 8
  br label %.lr.ph.us.new

..loopexit_crit_edge.us:                          ; preds = %._crit_edge.us
  %exitcond25 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond25, label %._crit_edge.loopexit, label %.preheader3.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
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
  br i1 true, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %8 = mul nsw i64 1000, %indvars.iv9
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %9 = add nsw i64 %8, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge13

; <label>:13:                                     ; preds = %._crit_edge14
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond12, label %._crit_edge.loopexit, label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
