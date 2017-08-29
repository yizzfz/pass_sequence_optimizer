; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader42.lr.ph, label %._crit_edge49

.preheader42.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader42.us.preheader, label %.preheader.lr.ph

.preheader42.us.preheader:                        ; preds = %.preheader42.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count79 = zext i32 %0 to i64
  br label %.preheader42.us

.preheader42.us:                                  ; preds = %._crit_edge52.us, %.preheader42.us.preheader
  %indvars.iv77 = phi i64 [ 0, %.preheader42.us.preheader ], [ %indvars.iv.next78, %._crit_edge52.us ]
  %12 = add i64 %indvars.iv77, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84, %.preheader42.us
  %indvars.iv74 = phi i64 [ 0, %.preheader42.us ], [ %indvars.iv.next75, %._crit_edge84 ]
  %14 = add nuw nsw i64 %indvars.iv74, %indvars.iv77
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv74
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv74 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv74
  store double %24, double* %25, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next75, %wide.trip.count
  br i1 %exitcond76, label %._crit_edge52.us, label %._crit_edge84

._crit_edge52.us:                                 ; preds = %._crit_edge84
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  br i1 %exitcond80, label %.preheader41, label %.preheader42.us

.preheader41:                                     ; preds = %._crit_edge52.us
  %26 = icmp sgt i32 %0, 0
  br i1 %26, label %.preheader.lr.ph, label %._crit_edge49

.preheader.lr.ph:                                 ; preds = %.preheader41, %.preheader42.lr.ph
  %27 = sitofp i32 %0 to double
  %28 = add i32 %0, 7
  %29 = add i32 %0, -2
  %30 = sext i32 %0 to i64
  %wide.trip.count62.7 = zext i32 %0 to i64
  %wide.trip.count73 = zext i32 %0 to i64
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph46.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit64, %._crit_edge
  %exitcond = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond, label %._crit_edge49.loopexit, label %.loopexit..lr.ph_crit_edge

.loopexit..lr.ph_crit_edge:                       ; preds = %.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit..lr.ph_crit_edge, %.preheader.lr.ph
  %indvars.iv71 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next72, %.loopexit..lr.ph_crit_edge ]
  %indvars.iv69 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next70, %.loopexit..lr.ph_crit_edge ]
  %31 = sub nsw i64 0, %indvars.iv71
  %32 = trunc i64 %31 to i32
  %33 = add i32 %28, %32
  %34 = trunc i64 %31 to i32
  %35 = add i32 %29, %34
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %xtraiter82 = and i64 %indvars.iv.next72, 1
  %lcmp.mod = icmp eq i64 %xtraiter82, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %36 = trunc i64 %indvars.iv71 to i32
  %37 = srem i32 %36, 100
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %27
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 0
  store double %39, double* %40, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %41 = icmp eq i64 %indvars.iv71, 0
  br i1 %41, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %42 = add nuw nsw i64 %indvars.iv, %indvars.iv71
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, 100
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %27
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv
  store double %46, double* %47, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = add nuw nsw i64 %indvars.iv.next, %indvars.iv71
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 100
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %27
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next
  store double %52, double* %53, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv69
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %54 = icmp slt i64 %indvars.iv.next72, %30
  br i1 %54, label %.lr.ph46, label %.loopexit

.lr.ph46:                                         ; preds = %._crit_edge
  %xtraiter65 = and i32 %33, 7
  %lcmp.mod66 = icmp eq i32 %xtraiter65, 0
  br i1 %lcmp.mod66, label %.prol.loopexit64, label %.prol.preheader63.preheader

.prol.preheader63.preheader:                      ; preds = %.lr.ph46
  br label %.prol.preheader63

.prol.preheader63:                                ; preds = %.prol.preheader63.preheader, %.prol.preheader63
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.prol.preheader63 ], [ %indvars.iv69, %.prol.preheader63.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader63 ], [ %xtraiter65, %.prol.preheader63.preheader ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv60.prol
  store double -9.990000e+02, double* %55, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit64.loopexit, label %.prol.preheader63, !llvm.loop !1

.prol.loopexit64.loopexit:                        ; preds = %.prol.preheader63
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.prol.loopexit64.loopexit, %.lr.ph46
  %indvars.iv60.unr = phi i64 [ %indvars.iv69, %.lr.ph46 ], [ %indvars.iv.next61.prol, %.prol.loopexit64.loopexit ]
  %56 = icmp ult i32 %35, 7
  br i1 %56, label %.loopexit, label %.lr.ph46.new.preheader

.lr.ph46.new.preheader:                           ; preds = %.prol.loopexit64
  br label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.lr.ph46.new.preheader, %.lr.ph46.new
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.7, %.lr.ph46.new ], [ %indvars.iv60.unr, %.lr.ph46.new.preheader ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv60
  store double -9.990000e+02, double* %57, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61
  store double -9.990000e+02, double* %58, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.1
  store double -9.990000e+02, double* %59, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.2
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.3
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next61.4 = add nsw i64 %indvars.iv60, 5
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.4
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next61.5 = add nsw i64 %indvars.iv60, 6
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.5
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next61.6 = add nsw i64 %indvars.iv60, 7
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.6
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next61.7 = add nsw i64 %indvars.iv60, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next61.7, %wide.trip.count62.7
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph46.new

._crit_edge49.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.preheader41, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge55

.preheader44.us.preheader:                        ; preds = %7
  %wide.trip.count84 = zext i32 %0 to i64
  %wide.trip.count80 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count = zext i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %11 = icmp eq i32 %1, 1
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next83, %._crit_edge51.us ]
  %12 = icmp sgt i64 %indvars.iv82, 0
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %12, label %.preheader.us.us.preheader, label %.preheader.us56.preheader

.preheader.us56.preheader:                        ; preds = %.preheader44.us
  br i1 %lcmp.mod, label %.preheader.us56.prol.loopexit.unr-lcssa, label %.preheader.us56.prol.preheader

.preheader.us56.prol.preheader:                   ; preds = %.preheader.us56.preheader
  br label %.preheader.us56.prol

.preheader.us56.prol:                             ; preds = %.preheader.us56.prol.preheader
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %2
  %20 = load double, double* %13, align 8
  %21 = fmul double %19, %20
  %22 = fadd double %16, %21
  %23 = fadd double %10, %22
  store double %23, double* %14, align 8
  br label %.preheader.us56.prol.loopexit.unr-lcssa

.preheader.us56.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us56.preheader, %.preheader.us56.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader.us56.prol ], [ 0, %.preheader.us56.preheader ]
  br label %.preheader.us56.prol.loopexit

.preheader.us56.prol.loopexit:                    ; preds = %.preheader.us56.prol.loopexit.unr-lcssa
  br i1 %11, label %._crit_edge51.us.loopexit89, label %.preheader.us56.preheader.new

.preheader.us56.preheader.new:                    ; preds = %.preheader.us56.prol.loopexit
  br label %.preheader.us56

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us56:                                  ; preds = %.preheader.us56, %.preheader.us56.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us56.preheader.new ], [ %indvars.iv.next.1, %.preheader.us56 ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %3
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %13, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = fadd double %10, %32
  store double %33, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %3
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %2
  %40 = load double, double* %13, align 8
  %41 = fmul double %39, %40
  %42 = fadd double %36, %41
  %43 = fadd double %10, %42
  store double %43, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit89.unr-lcssa, label %.preheader.us56

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit89.unr-lcssa:            ; preds = %.preheader.us56
  br label %._crit_edge51.us.loopexit89

._crit_edge51.us.loopexit89:                      ; preds = %.preheader.us56.prol.loopexit, %._crit_edge51.us.loopexit89.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit89, %._crit_edge51.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge55.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %2
  %51 = load double, double* %13, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %47, %52
  %54 = fmul double %68, %2
  %55 = fadd double %54, %53
  store double %55, double* %45, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge51.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv72 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next73, %._crit_edge ]
  %.047.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %68, %._crit_edge ]
  %56 = load double, double* %44, align 8
  %57 = fmul double %56, %2
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %65 = load double, double* %64, align 8
  %66 = load double, double* %58, align 8
  %67 = fmul double %65, %66
  %68 = fadd double %.047.us.us, %67
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %._crit_edge

._crit_edge55.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
