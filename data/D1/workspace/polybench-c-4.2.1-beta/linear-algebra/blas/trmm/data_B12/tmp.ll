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
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %10)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  %10 = sext i32 %0 to i64
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter22 = and i32 %1, 1
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  %11 = icmp eq i32 %1, 1
  %wide.trip.count19.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge5.us
  %indvars.iv26 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next27, %._crit_edge5.us ]
  %indvar = phi i32 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge5.us ]
  %indvars.iv15 = phi i32 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge5.us ]
  %12 = icmp sgt i64 %indvars.iv26, 0
  br i1 %12, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv26
  store double 1.000000e+00, double* %13, align 8
  %14 = trunc i64 %indvars.iv26 to i32
  %15 = add i32 %14, %1
  br i1 %lcmp.mod23, label %.prol.loopexit21, label %.prol.preheader20

.prol.preheader20:                                ; preds = %._crit_edge.us
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit21

.prol.loopexit21:                                 ; preds = %.prol.preheader20, %._crit_edge.us
  %indvars.iv17.unr.ph = phi i64 [ 1, %.prol.preheader20 ], [ 0, %._crit_edge.us ]
  br i1 %11, label %._crit_edge5.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit21
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.preheader, %._crit_edge.us.new
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %._crit_edge.us.new ], [ %indvars.iv17.unr.ph, %._crit_edge.us.new.preheader ]
  %20 = trunc i64 %indvars.iv17 to i32
  %21 = sub i32 %15, %20
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv17
  store double %24, double* %25, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %26 = trunc i64 %indvars.iv.next18 to i32
  %27 = sub i32 %15, %26
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv.next18
  store double %30, double* %31, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond.125 = icmp eq i64 %indvars.iv.next18.1, %wide.trip.count19.1
  br i1 %exitcond.125, label %._crit_edge5.us.loopexit, label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %32 = add nsw i64 %indvars.iv, %indvars.iv26
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = add nsw i64 %indvars.iv.next, %indvars.iv26
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %9
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %44 = trunc i64 %indvars.iv26 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 0
  store double %47, double* %48, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %49 = icmp eq i32 %indvar, 1
  br i1 %49, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv15 to i64
  br label %.lr.ph.us.new

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.new
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.prol.loopexit21
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %indvars.iv.next16 = add i32 %indvars.iv15, 1
  %50 = icmp slt i64 %indvars.iv.next27, %10
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %50, label %.preheader.us, label %._crit_edge8.loopexit

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvar35 = phi i32 [ %indvar.next36, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv30 = phi i32 [ %indvars.iv.next31, %._crit_edge ], [ 0, %.preheader.preheader ]
  %51 = icmp sgt i64 %indvars.iv41, 0
  br i1 %51, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter37 = and i32 %indvar35, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %.prol.loopexit34, label %.prol.preheader33

.prol.preheader33:                                ; preds = %.lr.ph
  %52 = trunc i64 %indvars.iv41 to i32
  %53 = srem i32 %52, %0
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %9
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 0
  store double %55, double* %56, align 8
  br label %.prol.loopexit34

.prol.loopexit34:                                 ; preds = %.prol.preheader33, %.lr.ph
  %indvars.iv28.unr.ph = phi i64 [ 1, %.prol.preheader33 ], [ 0, %.lr.ph ]
  %57 = icmp eq i32 %indvar35, 1
  br i1 %57, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit34
  %wide.trip.count32.1 = zext i32 %indvars.iv30 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph.new ], [ %indvars.iv28.unr.ph, %.lr.ph.new.preheader ]
  %58 = add nsw i64 %indvars.iv28, %indvars.iv41
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %9
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv28
  store double %62, double* %63, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %64 = add nsw i64 %indvars.iv.next29, %indvars.iv41
  %65 = trunc i64 %64 to i32
  %66 = srem i32 %65, %0
  %67 = sitofp i32 %66 to double
  %68 = fdiv double %67, %9
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv.next29
  store double %68, double* %69, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count32.1
  br i1 %exitcond.140, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit34, %.preheader
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv41
  store double 1.000000e+00, double* %70, align 8
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  %indvars.iv.next31 = add i32 %indvars.iv30, 1
  %71 = icmp slt i64 %indvars.iv.next42, %10
  %indvar.next36 = add nuw i32 %indvar35, 1
  br i1 %71, label %.preheader, label %._crit_edge8.loopexit45

._crit_edge8.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge8

._crit_edge8.loopexit45:                          ; preds = %._crit_edge
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit45, %._crit_edge8.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge10

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %0, -2
  %9 = add i32 %0, 1
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge6.us
  %indvars.iv30 = phi i64 [ 0, %.preheader3.us.preheader ], [ %12, %._crit_edge6.us ]
  %indvar = phi i32 [ 0, %.preheader3.us.preheader ], [ %indvar.next, %._crit_edge6.us ]
  %indvars.iv22.in = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv22, %._crit_edge6.us ]
  %indvars.iv22 = add nsw i64 %indvars.iv22.in, 1
  %11 = sub i32 %9, %indvar
  %12 = add nsw i64 %indvars.iv30, 1
  %13 = icmp slt i64 %12, %10
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %8, %indvar
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22.in, i64 %indvars.iv30
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv26 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next27, %._crit_edge.us ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv26
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us, %.prol.loopexit
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %2
  store double %18, double* %16, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %19 = phi double [ %31, %.lr.ph.us.new ], [ %.pre, %.lr.ph.us.new.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.lr.ph.us.new ], [ %indvars.iv20.unr.ph, %.lr.ph.us.new.preheader ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv30
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv26
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %24, %19
  store double %25, double* %16, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next21, i64 %indvars.iv30
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next21, i64 %indvars.iv26
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %30, %25
  store double %31, double* %16, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next21.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = load double, double* %15, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22.in, i64 %indvars.iv26
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %16, align 8
  %37 = fadd double %35, %36
  store double %37, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv20.unr.ph = phi i64 [ %indvars.iv22, %.prol.preheader ], [ %indvars.iv22.in, %.lr.ph.us ]
  br i1 %14, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %16, align 8
  br label %.lr.ph.us.new

._crit_edge6.us:                                  ; preds = %._crit_edge.us
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %13, label %.preheader3.us, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge6.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge3

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %11 = mul nsw i64 %10, %indvars.iv9
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %24 = icmp slt i64 %indvars.iv.next10, %10
  br i1 %24, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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
