; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = sext i32 %0 to i64
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %5 = add nsw i32 %0, 1
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %3, -1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge5.prol.loopexit, label %._crit_edge5.prol.preheader

._crit_edge5.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge5.prol

._crit_edge5.prol:                                ; preds = %._crit_edge5.prol, %._crit_edge5.prol.preheader
  %indvars.iv4.prol = phi i64 [ 0, %._crit_edge5.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge5.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge5.prol.preheader ], [ %prol.iter.sub, %._crit_edge5.prol ]
  %8 = sub nsw i64 %6, %indvars.iv4.prol
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv4.prol
  store double %10, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv4.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge5.prol.loopexit.unr-lcssa, label %._crit_edge5.prol, !llvm.loop !1

._crit_edge5.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge5.prol
  br label %._crit_edge5.prol.loopexit

._crit_edge5.prol.loopexit:                       ; preds = %.lr.ph, %._crit_edge5.prol.loopexit.unr-lcssa
  %indvars.iv4.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge5.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %7, 3
  br i1 %12, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge5.prol.loopexit
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.lr.ph.new
  %indvars.iv4 = phi i64 [ %indvars.iv4.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge5 ]
  %13 = sub nsw i64 %6, %indvars.iv4
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv4
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %17 = sub nsw i64 %6, %indvars.iv.next
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv4, 2
  %21 = sub nsw i64 %6, %indvars.iv.next.1
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %23, double* %24, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv4, 3
  %25 = sub nsw i64 %6, %indvars.iv.next.2
  %26 = trunc i64 %25 to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %27, double* %28, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv4, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %3
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge5

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge5
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge5.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #0 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 1
  br i1 %10, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %11 = load double, double* %1, align 8
  %12 = fsub double -0.000000e+00, %11
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvar = phi i64 [ 0, %.lr.ph.preheader ], [ %indvar.next, %..lr.ph_crit_edge ]
  %14 = phi double [ %12, %.lr.ph.preheader ], [ %61, %..lr.ph_crit_edge ]
  %.03052 = phi double [ 1.000000e+00, %.lr.ph.preheader ], [ %56, %..lr.ph_crit_edge ]
  %indvars.iv4551 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next46, %..lr.ph_crit_edge ]
  %15 = add i64 %indvar, 1
  %16 = add nsw i64 %indvars.iv4551, -1
  %xtraiter = and i64 %15, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge54.prol.loopexit, label %._crit_edge54.prol.preheader

._crit_edge54.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge54.prol

._crit_edge54.prol:                               ; preds = %._crit_edge54.prol, %._crit_edge54.prol.preheader
  %.048.prol = phi double [ 0.000000e+00, %._crit_edge54.prol.preheader ], [ %23, %._crit_edge54.prol ]
  %indvars.iv47.prol = phi i64 [ 0, %._crit_edge54.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge54.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge54.prol.preheader ], [ %prol.iter.sub, %._crit_edge54.prol ]
  %17 = sub nsw i64 %16, %indvars.iv47.prol
  %18 = getelementptr inbounds double, double* %1, i64 %17
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv47.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %.048.prol, %22
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge54.prol.loopexit.unr-lcssa, label %._crit_edge54.prol, !llvm.loop !3

._crit_edge54.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge54.prol
  br label %._crit_edge54.prol.loopexit

._crit_edge54.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge54.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %23, %._crit_edge54.prol.loopexit.unr-lcssa ]
  %.048.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %23, %._crit_edge54.prol.loopexit.unr-lcssa ]
  %indvars.iv47.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge54.prol.loopexit.unr-lcssa ]
  %24 = icmp ult i64 %indvar, 3
  br i1 %24, label %53, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge54.prol.loopexit
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54, %.lr.ph.new
  %.048 = phi double [ %.048.unr, %.lr.ph.new ], [ %52, %._crit_edge54 ]
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge54 ]
  %25 = sub nsw i64 %16, %indvars.iv47
  %26 = getelementptr inbounds double, double* %1, i64 %25
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %.048, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv47, 1
  %32 = sub nsw i64 %16, %indvars.iv.next
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %31, %37
  %indvars.iv.next.1 = add nsw i64 %indvars.iv47, 2
  %39 = sub nsw i64 %16, %indvars.iv.next.1
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %38, %44
  %indvars.iv.next.2 = add nsw i64 %indvars.iv47, 3
  %46 = sub nsw i64 %16, %indvars.iv.next.2
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %45, %51
  %indvars.iv.next.3 = add nsw i64 %indvars.iv47, 4
  %exitcond.3 = icmp eq i64 %indvars.iv4551, %indvars.iv.next.3
  br i1 %exitcond.3, label %.unr-lcssa, label %._crit_edge54

.unr-lcssa:                                       ; preds = %._crit_edge54
  br label %53

; <label>:53:                                     ; preds = %._crit_edge54.prol.loopexit, %.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge54.prol.loopexit ], [ %52, %.unr-lcssa ]
  %54 = fmul double %14, %14
  %55 = fsub double 1.000000e+00, %54
  %56 = fmul double %.03052, %55
  %57 = getelementptr inbounds double, double* %1, i64 %indvars.iv4551
  %58 = load double, double* %57, align 8
  %59 = fadd double %.lcssa, %58
  %60 = fsub double -0.000000e+00, %59
  %61 = fdiv double %60, %56
  %62 = and i64 %indvar, 1
  %lcmp.mod57 = icmp eq i64 %62, 0
  br i1 %lcmp.mod57, label %._crit_edge55.prol.preheader, label %._crit_edge55.prol.loopexit.unr-lcssa

._crit_edge55.prol.preheader:                     ; preds = %53
  br label %._crit_edge55.prol

._crit_edge55.prol:                               ; preds = %._crit_edge55.prol.preheader
  %63 = load double, double* %2, align 8
  %64 = getelementptr inbounds double, double* %2, i64 %16
  %65 = load double, double* %64, align 8
  %66 = fmul double %61, %65
  %67 = fadd double %63, %66
  store double %67, double* %13, align 16
  br label %._crit_edge55.prol.loopexit.unr-lcssa

._crit_edge55.prol.loopexit.unr-lcssa:            ; preds = %53, %._crit_edge55.prol
  %indvars.iv3349.unr.ph = phi i64 [ 1, %._crit_edge55.prol ], [ 0, %53 ]
  br label %._crit_edge55.prol.loopexit

._crit_edge55.prol.loopexit:                      ; preds = %._crit_edge55.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %indvar, 0
  br i1 %68, label %85, label %.new

.new:                                             ; preds = %._crit_edge55.prol.loopexit
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55, %.new
  %indvars.iv3349 = phi i64 [ %indvars.iv3349.unr.ph, %.new ], [ %indvars.iv.next34.1, %._crit_edge55 ]
  %69 = getelementptr inbounds double, double* %2, i64 %indvars.iv3349
  %70 = load double, double* %69, align 8
  %71 = sub nsw i64 %16, %indvars.iv3349
  %72 = getelementptr inbounds double, double* %2, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fmul double %61, %73
  %75 = fadd double %70, %74
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv3349
  store double %75, double* %76, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3349, 1
  %77 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next34
  %78 = load double, double* %77, align 8
  %79 = sub nsw i64 %16, %indvars.iv.next34
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fmul double %61, %81
  %83 = fadd double %78, %82
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next34
  store double %83, double* %84, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv3349, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv4551, %indvars.iv.next34.1
  br i1 %exitcond38.1, label %.unr-lcssa58, label %._crit_edge55

.unr-lcssa58:                                     ; preds = %._crit_edge55
  br label %85

; <label>:85:                                     ; preds = %._crit_edge55.prol.loopexit, %.unr-lcssa58
  %86 = shl i64 %indvar, 3
  %87 = add nuw i64 %86, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %87, i32 8, i1 false)
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv4551
  store double %61, double* %88, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4551, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next46, %9
  br i1 %exitcond53, label %._crit_edge.loopexit, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %85
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %85
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv4 = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv4 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.lr.ph._crit_edge

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv4
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

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
