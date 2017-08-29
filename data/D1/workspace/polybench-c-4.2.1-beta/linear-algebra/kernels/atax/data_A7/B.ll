; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call void @print_array(i32 2100, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #2 {
  %5 = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph24.preheader, label %.preheader17

.lr.ph24.preheader:                               ; preds = %4
  %7 = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %7, 0
  br i1 %lcmp.mod, label %.lr.ph24.prol.loopexit, label %.lr.ph24.prol

.lr.ph24.prol:                                    ; preds = %.lr.ph24.preheader
  %8 = fdiv double 0.000000e+00, %5
  %9 = fadd double %8, 1.000000e+00
  store double %9, double* %3, align 8
  br label %.lr.ph24.prol.loopexit

.lr.ph24.prol.loopexit:                           ; preds = %.lr.ph24.preheader, %.lr.ph24.prol
  %indvars.iv28.unr = phi i64 [ 0, %.lr.ph24.preheader ], [ 1, %.lr.ph24.prol ]
  %10 = icmp eq i32 %1, 1
  br i1 %10, label %.preheader17, label %.lr.ph24.preheader35

.lr.ph24.preheader35:                             ; preds = %.lr.ph24.prol.loopexit
  %wide.trip.count30.1 = zext i32 %1 to i64
  br label %.lr.ph24

.preheader17.loopexit:                            ; preds = %.lr.ph24
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.loopexit, %.lr.ph24.prol.loopexit, %4
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge21

.preheader.lr.ph:                                 ; preds = %.preheader17
  %12 = icmp sgt i32 %1, 0
  %13 = mul nsw i32 %0, 5
  %14 = sitofp i32 %13 to double
  br i1 %12, label %.preheader.us.preheader, label %._crit_edge21

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %15 = zext i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  %xtraiter = and i64 %15, 1
  %lcmp.mod36 = icmp eq i64 %xtraiter, 0
  %16 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us ]
  br i1 %lcmp.mod36, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %17

; <label>:17:                                     ; preds = %.prol.preheader
  %18 = trunc i64 %indvars.iv33 to i32
  %19 = srem i32 %18, %1
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %14
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv33, i64 0
  store double %21, double* %22, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %17
  %indvars.iv.unr.ph = phi i64 [ 1, %17 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %16, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %23 ]
  %24 = add i64 %indvars.iv, %indvars.iv33
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = add i64 %indvars.iv.next, %indvars.iv33
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %1
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %14, i32 0
  %34 = insertelement <2 x double> %33, double %14, i32 1
  %35 = insertelement <2 x double> undef, double %27, i32 0
  %36 = insertelement <2 x double> %35, double %32, i32 1
  %37 = fdiv <2 x double> %36, %34
  %38 = bitcast double* %28 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next.1, %15
  br i1 %exitcond32.1, label %._crit_edge.us.unr-lcssa, label %23

._crit_edge.us.unr-lcssa:                         ; preds = %23
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %wide.trip.count
  br i1 %exitcond, label %._crit_edge21.loopexit, label %.preheader.us

.lr.ph24:                                         ; preds = %.lr.ph24.preheader35, %.lr.ph24
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph24 ], [ %indvars.iv28.unr, %.lr.ph24.preheader35 ]
  %39 = trunc i64 %indvars.iv28 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv28
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %42 = trunc i64 %indvars.iv.next29 to i32
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %5, i32 0
  %45 = insertelement <2 x double> %44, double %5, i32 1
  %46 = insertelement <2 x double> undef, double %40, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = fdiv <2 x double> %47, %45
  %49 = fadd <2 x double> %48, <double 1.000000e+00, double 1.000000e+00>
  %50 = bitcast double* %41 to <2 x double>*
  store <2 x double> %49, <2 x double>* %50, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count30.1
  br i1 %exitcond31.1, label %.preheader17.loopexit, label %.lr.ph24

._crit_edge21.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader.lr.ph, %.preheader17
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #2 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader30.loopexit, label %.preheader30

.preheader30.loopexit:                            ; preds = %6
  %9 = bitcast double* %4 to i8*
  %10 = zext i32 %1 to i64
  %11 = shl nuw nsw i64 %10, 3
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %11, i32 8, i1 false)
  br label %.preheader30

.preheader30:                                     ; preds = %.preheader30.loopexit, %6
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph35, label %._crit_edge36

.lr.ph35:                                         ; preds = %.preheader30
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.lr.ph35.split.us.preheader, label %._crit_edge36.loopexit56

.lr.ph35.split.us.preheader:                      ; preds = %.lr.ph35
  %14 = zext i32 %1 to i64
  %15 = add nsw i64 %14, -1
  %xtraiter = and i64 %14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %16 = icmp eq i64 %15, 0
  %xtraiter69 = and i64 %14, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %17 = icmp eq i64 %15, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %wide.trip.count59.1 = zext i32 %1 to i64
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %wide.trip.count = zext i32 %0 to i64
  %sunkaddr52 = ptrtoint double* %5 to i64
  %sunkaddr52.1 = ptrtoint double* %5 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %sunkaddr52.prol = ptrtoint double* %5 to i64
  %18 = add nsw i64 %14, -2
  %scevgep75 = getelementptr double, double* %4, i64 2
  %19 = add nsw i64 %14, -2
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %._crit_edge.us, %.lr.ph35.split.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next72, %._crit_edge.us ]
  %scevgep81 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 2
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv71
  store double 0.000000e+00, double* %20, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph35.split.us
  %sunkaddr53.prol = shl nsw i64 %indvars.iv71, 3
  %sunkaddr54.prol = add i64 %sunkaddr52.prol, %sunkaddr53.prol
  %sunkaddr55.prol = inttoptr i64 %sunkaddr54.prol to double*
  %21 = load double, double* %sunkaddr55.prol, align 8
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 0
  %23 = load double, double* %22, align 8
  %24 = load double, double* %3, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %21, %25
  store double %26, double* %sunkaddr55.prol, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph35.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph35.split.us ]
  br i1 %16, label %.lr.ph33.us.preheader, label %.lr.ph35.split.us.new.preheader

.lr.ph35.split.us.new.preheader:                  ; preds = %.prol.loopexit
  %sunkaddr53 = shl nsw i64 %indvars.iv71, 3
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %sunkaddr53.1 = shl nsw i64 %indvars.iv71, 3
  %sunkaddr54.1 = add i64 %sunkaddr52.1, %sunkaddr53.1
  %sunkaddr55.1 = inttoptr i64 %sunkaddr54.1 to double*
  br label %.lr.ph35.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph33.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph33.us.prol.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond = icmp eq i64 %indvars.iv.next72, %wide.trip.count
  br i1 %exitcond, label %._crit_edge36.loopexit, label %.lr.ph35.split.us

.lr.ph33.us:                                      ; preds = %.lr.ph33.us.preheader98, %.lr.ph33.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %.lr.ph33.us ], [ %indvars.iv57.ph, %.lr.ph33.us.preheader98 ]
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv57
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv57
  %30 = load double, double* %29, align 8
  %31 = load double, double* %sunkaddr51, align 8
  %32 = fmul double %30, %31
  %33 = fadd double %28, %32
  store double %33, double* %27, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next58
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv.next58
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr51.1, align 8
  %39 = fmul double %37, %38
  %40 = fadd double %35, %39
  store double %40, double* %34, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count59.1
  br i1 %exitcond60.1, label %._crit_edge.us.loopexit, label %.lr.ph33.us, !llvm.loop !1

.lr.ph35.split.us.new:                            ; preds = %.lr.ph35.split.us.new.preheader, %.lr.ph35.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph35.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph35.split.us.new.preheader ]
  %41 = load double, double* %sunkaddr55, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %sunkaddr55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = load double, double* %sunkaddr55.1, align 8
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %sunkaddr55.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph33.us.preheader.loopexit, label %.lr.ph35.split.us.new

.lr.ph33.us.preheader.loopexit:                   ; preds = %.lr.ph35.split.us.new
  br label %.lr.ph33.us.preheader

.lr.ph33.us.preheader:                            ; preds = %.lr.ph33.us.preheader.loopexit, %.prol.loopexit
  br i1 %lcmp.mod70, label %.lr.ph33.us.prol.loopexit, label %.lr.ph33.us.prol

.lr.ph33.us.prol:                                 ; preds = %.lr.ph33.us.preheader
  %55 = load double, double* %4, align 8
  %56 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 0
  %57 = load double, double* %56, align 8
  %sunkaddr49.prol = shl nsw i64 %indvars.iv71, 3
  %sunkaddr50.prol = add i64 %sunkaddr.prol, %sunkaddr49.prol
  %sunkaddr51.prol = inttoptr i64 %sunkaddr50.prol to double*
  %58 = load double, double* %sunkaddr51.prol, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  store double %60, double* %4, align 8
  br label %.lr.ph33.us.prol.loopexit

.lr.ph33.us.prol.loopexit:                        ; preds = %.lr.ph33.us.prol, %.lr.ph33.us.preheader
  %indvars.iv57.unr.ph = phi i64 [ 1, %.lr.ph33.us.prol ], [ 0, %.lr.ph33.us.preheader ]
  br i1 %17, label %._crit_edge.us, label %.lr.ph33.us.preheader73

.lr.ph33.us.preheader73:                          ; preds = %.lr.ph33.us.prol.loopexit
  %sunkaddr49 = shl nsw i64 %indvars.iv71, 3
  %sunkaddr50 = add i64 %sunkaddr, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  %sunkaddr49.1 = shl nsw i64 %indvars.iv71, 3
  %sunkaddr50.1 = add i64 %sunkaddr.1, %sunkaddr49.1
  %sunkaddr51.1 = inttoptr i64 %sunkaddr50.1 to double*
  %61 = sub nsw i64 %18, %indvars.iv57.unr.ph
  %62 = lshr i64 %61, 1
  %63 = add nuw i64 %62, 1
  %min.iters.check = icmp ult i64 %63, 2
  br i1 %min.iters.check, label %.lr.ph33.us.preheader98, label %min.iters.checked

.lr.ph33.us.preheader98:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph33.us.preheader73
  %indvars.iv57.ph = phi i64 [ %indvars.iv57.unr.ph, %vector.memcheck ], [ %indvars.iv57.unr.ph, %min.iters.checked ], [ %indvars.iv57.unr.ph, %.lr.ph33.us.preheader73 ], [ %ind.end, %middle.block ]
  br label %.lr.ph33.us

min.iters.checked:                                ; preds = %.lr.ph33.us.preheader73
  %n.mod.vf = and i64 %63, 1
  %n.vec = sub i64 %63, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph33.us.preheader98, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %4, i64 %indvars.iv57.unr.ph
  %scevgep74 = bitcast double* %scevgep to i8*
  %64 = sub nsw i64 %19, %indvars.iv57.unr.ph
  %65 = and i64 %64, -2
  %66 = or i64 %indvars.iv57.unr.ph, %65
  %scevgep76 = getelementptr double, double* %scevgep75, i64 %66
  %scevgep7677 = bitcast double* %scevgep76 to i8*
  %scevgep79 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %indvars.iv57.unr.ph
  %scevgep82 = getelementptr double, double* %scevgep81, i64 %66
  %bound0 = icmp ult double* %scevgep, %scevgep82
  %bound1 = icmp ult double* %scevgep79, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bc = inttoptr i64 %sunkaddr50 to i8*
  %bc84 = inttoptr i64 %sunkaddr50 to i8*
  %bound085 = icmp ult i8* %scevgep74, %bc84
  %bound186 = icmp ult i8* %bc, %scevgep7677
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  %bc88 = inttoptr i64 %sunkaddr50.1 to i8*
  %bc89 = inttoptr i64 %sunkaddr50.1 to i8*
  %bound090 = icmp ult i8* %scevgep74, %bc89
  %bound191 = icmp ult i8* %bc88, %scevgep7677
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx, %found.conflict92
  %67 = or i64 %indvars.iv57.unr.ph, 2
  %68 = shl nuw i64 %62, 1
  %69 = add i64 %67, %68
  %70 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %69, %70
  br i1 %conflict.rdx93, label %.lr.ph33.us.preheader98, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %71 = load double, double* %sunkaddr51, align 8, !alias.scope !4
  %72 = insertelement <2 x double> undef, double %71, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = load double, double* %sunkaddr51.1, align 8, !alias.scope !7
  %75 = insertelement <2 x double> undef, double %74, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %77 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv57.unr.ph, %77
  %78 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !9, !noalias !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec94 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv71, i64 %offset.idx
  %81 = bitcast double* %80 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !13
  %strided.vec96 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec97 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = fmul <2 x double> %strided.vec96, %73
  %83 = fadd <2 x double> %strided.vec, %82
  %84 = add nuw nsw i64 %offset.idx, 1
  %85 = getelementptr inbounds double, double* %4, i64 %84
  %86 = fmul <2 x double> %strided.vec97, %76
  %87 = fadd <2 x double> %strided.vec94, %86
  %88 = getelementptr double, double* %85, i64 -1
  %89 = bitcast double* %88 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %83, <2 x double> %87, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %89, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 2
  %90 = icmp eq i64 %index.next, %n.vec
  br i1 %90, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph33.us.preheader98

._crit_edge36.loopexit56:                         ; preds = %.lr.ph35
  %91 = zext i32 %0 to i64
  %92 = shl nuw nsw i64 %91, 3
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %92, i32 8, i1 false)
  br label %._crit_edge36

._crit_edge36.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36.loopexit, %._crit_edge36.loopexit56, %.preheader30
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %8 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %14, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %14 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %.lr.ph, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next, %8
  br i1 %exitcond5, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12, !5, !8}
!12 = distinct !{!12, !6}
!13 = !{!12}
!14 = distinct !{!14, !2, !3}
