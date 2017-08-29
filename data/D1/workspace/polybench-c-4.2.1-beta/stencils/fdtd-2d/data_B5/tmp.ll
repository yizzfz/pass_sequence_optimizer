; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph29.preheader, label %.preheader23

.lr.ph29.preheader:                               ; preds = %7
  %9 = add i32 %0, -1
  %xtraiter = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph29.prol.loopexit, label %.lr.ph29.prol.preheader

.lr.ph29.prol.preheader:                          ; preds = %.lr.ph29.preheader
  br label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.prol.preheader, %.lr.ph29.prol
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %.lr.ph29.prol ], [ 0, %.lr.ph29.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph29.prol ], [ %xtraiter, %.lr.ph29.prol.preheader ]
  %10 = trunc i64 %indvars.iv36.prol to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %indvars.iv36.prol
  store double %11, double* %12, align 8
  %indvars.iv.next37.prol = add nuw nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph29.prol.loopexit.loopexit, label %.lr.ph29.prol, !llvm.loop !1

.lr.ph29.prol.loopexit.loopexit:                  ; preds = %.lr.ph29.prol
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.prol.loopexit.loopexit, %.lr.ph29.preheader
  %indvars.iv36.unr = phi i64 [ 0, %.lr.ph29.preheader ], [ %indvars.iv.next37.prol, %.lr.ph29.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %9, 7
  br i1 %13, label %.preheader23, label %.lr.ph29.preheader40

.lr.ph29.preheader40:                             ; preds = %.lr.ph29.prol.loopexit
  %wide.trip.count38.7 = zext i32 %0 to i64
  br label %.lr.ph29

.preheader23.loopexit:                            ; preds = %.lr.ph29
  br label %.preheader23

.preheader23:                                     ; preds = %.preheader23.loopexit, %.lr.ph29.prol.loopexit, %7
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.preheader.lr.ph, label %._crit_edge26

.preheader.lr.ph:                                 ; preds = %.preheader23
  %15 = icmp sgt i32 %2, 0
  %16 = sitofp i32 %1 to double
  %17 = sitofp i32 %2 to double
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge26

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count33 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %18 = trunc i64 %indvars.iv31 to i32
  %19 = sitofp i32 %18 to double
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %20 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = trunc i64 %indvars.iv.next to i32
  %22 = sitofp i32 %21 to double
  %23 = fmul double %19, %22
  %24 = fdiv double %23, %16
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv
  store double %24, double* %25, align 8
  %26 = add nuw nsw i64 %indvars.iv, 2
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = fmul double %19, %28
  %30 = fdiv double %29, %17
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  store double %30, double* %31, align 8
  %32 = add nuw nsw i64 %indvars.iv, 3
  %33 = trunc i64 %32 to i32
  %34 = sitofp i32 %33 to double
  %35 = fmul double %19, %34
  %36 = fdiv double %35, %16
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv
  store double %36, double* %37, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge26.loopexit, label %.preheader.us

.lr.ph29:                                         ; preds = %.lr.ph29.preheader40, %.lr.ph29
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.7, %.lr.ph29 ], [ %indvars.iv36.unr, %.lr.ph29.preheader40 ]
  %38 = trunc i64 %indvars.iv36 to i32
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds double, double* %6, i64 %indvars.iv36
  store double %39, double* %40, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %41 = trunc i64 %indvars.iv.next37 to i32
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37
  store double %42, double* %43, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %44 = trunc i64 %indvars.iv.next37.1 to i32
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.1
  store double %45, double* %46, align 8
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %47 = trunc i64 %indvars.iv.next37.2 to i32
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.2
  store double %48, double* %49, align 8
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %50 = trunc i64 %indvars.iv.next37.3 to i32
  %51 = sitofp i32 %50 to double
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.3
  store double %51, double* %52, align 8
  %indvars.iv.next37.4 = add nsw i64 %indvars.iv36, 5
  %53 = trunc i64 %indvars.iv.next37.4 to i32
  %54 = sitofp i32 %53 to double
  %55 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.4
  store double %54, double* %55, align 8
  %indvars.iv.next37.5 = add nsw i64 %indvars.iv36, 6
  %56 = trunc i64 %indvars.iv.next37.5 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.5
  store double %57, double* %58, align 8
  %indvars.iv.next37.6 = add nsw i64 %indvars.iv36, 7
  %59 = trunc i64 %indvars.iv.next37.6 to i32
  %60 = sitofp i32 %59 to double
  %61 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next37.6
  store double %60, double* %61, align 8
  %indvars.iv.next37.7 = add nsw i64 %indvars.iv36, 8
  %exitcond39.7 = icmp eq i64 %indvars.iv.next37.7, %wide.trip.count38.7
  br i1 %exitcond39.7, label %.preheader23.loopexit, label %.lr.ph29

._crit_edge26.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.preheader.lr.ph, %.preheader23
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader73.lr.ph, label %._crit_edge88

.preheader73.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %2, 0
  %10 = add nsw i32 %1, -1
  %11 = add nsw i32 %2, -1
  %xtraiter = and i32 %2, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %11, 7
  %wide.trip.count.7 = zext i32 %2 to i64
  %xtraiter97 = and i32 %2, 1
  %lcmp.mod98 = icmp eq i32 %xtraiter97, 0
  %13 = icmp eq i32 %11, 0
  %wide.trip.count102 = zext i32 %1 to i64
  %wide.trip.count94.1 = zext i32 %2 to i64
  %xtraiter110 = and i32 %11, 1
  %lcmp.mod111 = icmp eq i32 %xtraiter110, 0
  %14 = icmp eq i32 %2, 2
  %wide.trip.count114 = zext i32 %1 to i64
  %wide.trip.count106.1 = zext i32 %2 to i64
  %wide.trip.count123 = zext i32 %10 to i64
  %wide.trip.count119 = zext i32 %11 to i64
  %wide.trip.count127 = zext i32 %0 to i64
  %15 = add nuw nsw i64 %wide.trip.count119, 1
  %16 = add nsw i64 %wide.trip.count106.1, -2
  %17 = add nsw i64 %wide.trip.count106.1, -2
  %18 = add nsw i64 %wide.trip.count106.1, -2
  %19 = add nsw i64 %wide.trip.count106.1, -2
  %.not = icmp slt i32 %1, 2
  %.not129 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not129
  %.not130 = icmp slt i32 %1, 1
  %.not131 = icmp slt i32 %2, 2
  %brmerge132 = or i1 %.not130, %.not131
  %.not133 = icmp slt i32 %1, 2
  %.not134 = icmp slt i32 %2, 2
  %brmerge135 = or i1 %.not133, %.not134
  %min.iters.check = icmp ult i32 %11, 4
  %20 = and i32 %11, 3
  %n.mod.vf = zext i32 %20 to i64
  %n.vec = sub nsw i64 %wide.trip.count119, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %20, 0
  br label %.preheader73

.preheader73:                                     ; preds = %._crit_edge86, %.preheader73.lr.ph
  %indvars.iv125 = phi i64 [ 0, %.preheader73.lr.ph ], [ %indvars.iv.next126, %._crit_edge86 ]
  br i1 %9, label %.lr.ph, label %.preheader72

.lr.ph:                                           ; preds = %.preheader73
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv125
  %22 = bitcast double* %21 to i64*
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.prol
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %12, label %.preheader72, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader72.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader72

.preheader72:                                     ; preds = %.preheader72.loopexit, %.prol.loopexit, %.preheader73
  br i1 %brmerge, label %.preheader71, label %.preheader69.us.preheader

.preheader69.us.preheader:                        ; preds = %.preheader72
  br label %.preheader69.us

.preheader69.us:                                  ; preds = %.preheader69.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader69.us.preheader ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge.us ], [ 1, %.preheader69.us.preheader ]
  %26 = add i64 %indvar, 1
  %scevgep213 = getelementptr [1200 x double], [1200 x double]* %4, i64 %26, i64 2
  %scevgep219 = getelementptr [1200 x double], [1200 x double]* %5, i64 %26, i64 2
  %27 = add nsw i64 %indvars.iv100, -1
  br i1 %lcmp.mod98, label %.prol.loopexit96, label %.prol.preheader95

.prol.preheader95:                                ; preds = %.preheader69.us
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 0
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 0
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %27, i64 0
  %33 = load double, double* %32, align 8
  %34 = fsub double %31, %33
  %35 = fmul double %34, 5.000000e-01
  %36 = fsub double %29, %35
  store double %36, double* %28, align 8
  br label %.prol.loopexit96

.prol.loopexit96:                                 ; preds = %.prol.preheader95, %.preheader69.us
  %indvars.iv92.unr.ph = phi i64 [ 1, %.prol.preheader95 ], [ 0, %.preheader69.us ]
  br i1 %13, label %._crit_edge.us, label %.preheader69.us.new.preheader

.preheader69.us.new.preheader:                    ; preds = %.prol.loopexit96
  %37 = sub nsw i64 %18, %indvars.iv92.unr.ph
  %38 = lshr i64 %37, 1
  %39 = add nuw i64 %38, 1
  %min.iters.check204 = icmp ult i64 %39, 2
  br i1 %min.iters.check204, label %.preheader69.us.new.preheader248, label %min.iters.checked205

min.iters.checked205:                             ; preds = %.preheader69.us.new.preheader
  %n.mod.vf206 = and i64 %39, 1
  %n.vec207 = sub i64 %39, %n.mod.vf206
  %cmp.zero208 = icmp eq i64 %n.vec207, 0
  br i1 %cmp.zero208, label %.preheader69.us.new.preheader248, label %vector.memcheck226

vector.memcheck226:                               ; preds = %min.iters.checked205
  %scevgep211 = getelementptr [1200 x double], [1200 x double]* %4, i64 %26, i64 %indvars.iv92.unr.ph
  %40 = sub nsw i64 %19, %indvars.iv92.unr.ph
  %41 = and i64 %40, -2
  %42 = or i64 %indvars.iv92.unr.ph, %41
  %scevgep214 = getelementptr double, double* %scevgep213, i64 %42
  %scevgep217 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 %indvars.iv92.unr.ph
  %scevgep220 = getelementptr double, double* %scevgep219, i64 %42
  %bound0222 = icmp ult double* %scevgep211, %scevgep220
  %bound1223 = icmp ult double* %scevgep217, %scevgep214
  %memcheck.conflict225 = and i1 %bound0222, %bound1223
  %43 = or i64 %indvars.iv92.unr.ph, 2
  %44 = shl nuw i64 %38, 1
  %45 = add i64 %43, %44
  %46 = shl nuw nsw i64 %n.mod.vf206, 1
  %ind.end231 = sub i64 %45, %46
  br i1 %memcheck.conflict225, label %.preheader69.us.new.preheader248, label %vector.body201.preheader

vector.body201.preheader:                         ; preds = %vector.memcheck226
  br label %vector.body201

vector.body201:                                   ; preds = %vector.body201.preheader, %vector.body201
  %index228 = phi i64 [ %index.next229, %vector.body201 ], [ 0, %vector.body201.preheader ]
  %47 = shl i64 %index228, 1
  %offset.idx233 = or i64 %indvars.iv92.unr.ph, %47
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %offset.idx233
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec237 = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !4, !noalias !7
  %strided.vec238 = shufflevector <4 x double> %wide.vec237, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec239 = shufflevector <4 x double> %wide.vec237, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %offset.idx233
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec240 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !7
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %27, i64 %offset.idx233
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec243 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !7
  %54 = fsub <4 x double> %wide.vec240, %wide.vec243
  %55 = shufflevector <4 x double> %54, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %56 = fmul <2 x double> %55, <double 5.000000e-01, double 5.000000e-01>
  %57 = fsub <2 x double> %strided.vec238, %56
  %58 = add nuw nsw i64 %offset.idx233, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %58
  %60 = fsub <4 x double> %wide.vec240, %wide.vec243
  %61 = shufflevector <4 x double> %60, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %63 = fsub <2 x double> %strided.vec239, %62
  %64 = getelementptr double, double* %59, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec246 = shufflevector <2 x double> %57, <2 x double> %63, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec246, <4 x double>* %65, align 8, !alias.scope !4, !noalias !7
  %index.next229 = add i64 %index228, 2
  %66 = icmp eq i64 %index.next229, %n.vec207
  br i1 %66, label %middle.block202, label %vector.body201, !llvm.loop !9

middle.block202:                                  ; preds = %vector.body201
  %cmp.n232 = icmp eq i64 %n.mod.vf206, 0
  br i1 %cmp.n232, label %._crit_edge.us, label %.preheader69.us.new.preheader248

.preheader69.us.new.preheader248:                 ; preds = %middle.block202, %vector.memcheck226, %min.iters.checked205, %.preheader69.us.new.preheader
  %indvars.iv92.ph = phi i64 [ %indvars.iv92.unr.ph, %vector.memcheck226 ], [ %indvars.iv92.unr.ph, %min.iters.checked205 ], [ %indvars.iv92.unr.ph, %.preheader69.us.new.preheader ], [ %ind.end231, %middle.block202 ]
  br label %.preheader69.us.new

.preheader69.us.new:                              ; preds = %.preheader69.us.new.preheader248, %.preheader69.us.new
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %.preheader69.us.new ], [ %indvars.iv92.ph, %.preheader69.us.new.preheader248 ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv92
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv92
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %27, i64 %indvars.iv92
  %72 = load double, double* %71, align 8
  %73 = fsub double %70, %72
  %74 = fmul double %73, 5.000000e-01
  %75 = fsub double %68, %74
  store double %75, double* %67, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv100, i64 %indvars.iv.next93
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv100, i64 %indvars.iv.next93
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %27, i64 %indvars.iv.next93
  %81 = load double, double* %80, align 8
  %82 = fsub double %79, %81
  %83 = fmul double %82, 5.000000e-01
  %84 = fsub double %77, %83
  store double %84, double* %76, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next93.1, %wide.trip.count94.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader69.us.new, !llvm.loop !12

._crit_edge.us.loopexit:                          ; preds = %.preheader69.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block202, %.prol.loopexit96
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond = icmp eq i64 %indvars.iv.next101, %wide.trip.count102
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader71.loopexit, label %.preheader69.us

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %85 = load i64, i64* %22, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %88 = load i64, i64* %22, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %91 = load i64, i64* %22, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %94 = load i64, i64* %22, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %97 = load i64, i64* %22, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %100 = load i64, i64* %22, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %103 = load i64, i64* %22, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %106 = load i64, i64* %22, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %.preheader72.loopexit, label %.lr.ph.new

.preheader71.loopexit:                            ; preds = %._crit_edge.us
  br label %.preheader71

.preheader71:                                     ; preds = %.preheader71.loopexit, %.preheader72
  br i1 %brmerge132, label %.preheader70, label %.preheader68.us.preheader

.preheader68.us.preheader:                        ; preds = %.preheader71
  br label %.preheader68.us

.preheader68.us:                                  ; preds = %.preheader68.us.preheader, %._crit_edge80.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge80.us ], [ 0, %.preheader68.us.preheader ]
  %scevgep172 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 2
  %scevgep175 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 -1
  %scevgep178 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 2
  br i1 %lcmp.mod111, label %.prol.loopexit109, label %.prol.preheader108

.prol.preheader108:                               ; preds = %.preheader68.us
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 1
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 1
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 0
  %114 = load double, double* %113, align 8
  %115 = fsub double %112, %114
  %116 = fmul double %115, 5.000000e-01
  %117 = fsub double %110, %116
  store double %117, double* %109, align 8
  br label %.prol.loopexit109

.prol.loopexit109:                                ; preds = %.prol.preheader108, %.preheader68.us
  %indvars.iv104.unr.ph = phi i64 [ 2, %.prol.preheader108 ], [ 1, %.preheader68.us ]
  br i1 %14, label %._crit_edge80.us, label %.preheader68.us.new.preheader

.preheader68.us.new.preheader:                    ; preds = %.prol.loopexit109
  %118 = sub nsw i64 %16, %indvars.iv104.unr.ph
  %119 = lshr i64 %118, 1
  %120 = add nuw i64 %119, 1
  %min.iters.check163 = icmp ult i64 %120, 2
  br i1 %min.iters.check163, label %.preheader68.us.new.preheader247, label %min.iters.checked164

min.iters.checked164:                             ; preds = %.preheader68.us.new.preheader
  %n.mod.vf165 = and i64 %120, 1
  %n.vec166 = sub i64 %120, %n.mod.vf165
  %cmp.zero167 = icmp eq i64 %n.vec166, 0
  br i1 %cmp.zero167, label %.preheader68.us.new.preheader247, label %vector.memcheck185

vector.memcheck185:                               ; preds = %min.iters.checked164
  %scevgep170 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv104.unr.ph
  %121 = sub nsw i64 %17, %indvars.iv104.unr.ph
  %122 = and i64 %121, -2
  %123 = add nsw i64 %indvars.iv104.unr.ph, %122
  %scevgep173 = getelementptr double, double* %scevgep172, i64 %123
  %scevgep176 = getelementptr double, double* %scevgep175, i64 %indvars.iv104.unr.ph
  %scevgep179 = getelementptr double, double* %scevgep178, i64 %123
  %bound0181 = icmp ult double* %scevgep170, %scevgep179
  %bound1182 = icmp ult double* %scevgep176, %scevgep173
  %memcheck.conflict184 = and i1 %bound0181, %bound1182
  %124 = add nuw nsw i64 %indvars.iv104.unr.ph, 2
  %125 = shl nuw i64 %119, 1
  %126 = add i64 %124, %125
  %127 = shl nuw nsw i64 %n.mod.vf165, 1
  %ind.end = sub i64 %126, %127
  br i1 %memcheck.conflict184, label %.preheader68.us.new.preheader247, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %vector.memcheck185
  br label %vector.body160

vector.body160:                                   ; preds = %vector.body160.preheader, %vector.body160
  %index187 = phi i64 [ %index.next188, %vector.body160 ], [ 0, %vector.body160.preheader ]
  %128 = shl i64 %index187, 1
  %offset.idx = or i64 %indvars.iv104.unr.ph, %128
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %offset.idx
  %130 = bitcast double* %129 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %130, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec194 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %offset.idx
  %132 = getelementptr double, double* %131, i64 -1
  %133 = bitcast double* %132 to <4 x double>*
  %wide.vec195 = load <4 x double>, <4 x double>* %133, align 8, !alias.scope !16
  %strided.vec196 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec197 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %134 = fsub <2 x double> %strided.vec197, %strided.vec196
  %135 = fmul <2 x double> %134, <double 5.000000e-01, double 5.000000e-01>
  %136 = fsub <2 x double> %strided.vec, %135
  %137 = add nuw nsw i64 %offset.idx, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %137
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %137
  %140 = getelementptr double, double* %139, i64 -1
  %141 = bitcast double* %140 to <4 x double>*
  %wide.vec198 = load <4 x double>, <4 x double>* %141, align 8, !alias.scope !16
  %strided.vec199 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec200 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %142 = fsub <2 x double> %strided.vec200, %strided.vec199
  %143 = fmul <2 x double> %142, <double 5.000000e-01, double 5.000000e-01>
  %144 = fsub <2 x double> %strided.vec194, %143
  %145 = getelementptr double, double* %138, i64 -1
  %146 = bitcast double* %145 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %136, <2 x double> %144, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %146, align 8, !alias.scope !13, !noalias !16
  %index.next188 = add i64 %index187, 2
  %147 = icmp eq i64 %index.next188, %n.vec166
  br i1 %147, label %middle.block161, label %vector.body160, !llvm.loop !18

middle.block161:                                  ; preds = %vector.body160
  %cmp.n190 = icmp eq i64 %n.mod.vf165, 0
  br i1 %cmp.n190, label %._crit_edge80.us, label %.preheader68.us.new.preheader247

.preheader68.us.new.preheader247:                 ; preds = %middle.block161, %vector.memcheck185, %min.iters.checked164, %.preheader68.us.new.preheader
  %indvars.iv104.ph = phi i64 [ %indvars.iv104.unr.ph, %vector.memcheck185 ], [ %indvars.iv104.unr.ph, %min.iters.checked164 ], [ %indvars.iv104.unr.ph, %.preheader68.us.new.preheader ], [ %ind.end, %middle.block161 ]
  br label %.preheader68.us.new

.preheader68.us.new:                              ; preds = %.preheader68.us.new.preheader247, %.preheader68.us.new
  %indvars.iv104 = phi i64 [ %indvars.iv.next105.1, %.preheader68.us.new ], [ %indvars.iv104.ph, %.preheader68.us.new.preheader247 ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv104
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %151 = load double, double* %150, align 8
  %152 = add nsw i64 %indvars.iv104, -1
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %152
  %154 = load double, double* %153, align 8
  %155 = fsub double %151, %154
  %156 = fmul double %155, 5.000000e-01
  %157 = fsub double %149, %156
  store double %157, double* %148, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv112, i64 %indvars.iv.next105
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv.next105
  %161 = load double, double* %160, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv112, i64 %indvars.iv104
  %163 = load double, double* %162, align 8
  %164 = fsub double %161, %163
  %165 = fmul double %164, 5.000000e-01
  %166 = fsub double %159, %165
  store double %166, double* %158, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next105.1, %wide.trip.count106.1
  br i1 %exitcond107.1, label %._crit_edge80.us.loopexit, label %.preheader68.us.new, !llvm.loop !19

._crit_edge80.us.loopexit:                        ; preds = %.preheader68.us.new
  br label %._crit_edge80.us

._crit_edge80.us:                                 ; preds = %._crit_edge80.us.loopexit, %middle.block161, %.prol.loopexit109
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, %wide.trip.count114
  br i1 %exitcond115, label %.preheader70.loopexit, label %.preheader68.us

.preheader70.loopexit:                            ; preds = %._crit_edge80.us
  br label %.preheader70

.preheader70:                                     ; preds = %.preheader70.loopexit, %.preheader71
  br i1 %brmerge135, label %._crit_edge86, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader70
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge84.us
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge84.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %wide.trip.count119
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 0
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %15
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 0
  %167 = add i64 %indvars.iv121, 1
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %4, i64 %167, i64 %wide.trip.count119
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep141
  %bound1 = icmp ult double* %scevgep139, %scevgep137
  %found.conflict = and i1 %bound0, %bound1
  %bound0147 = icmp ult double* %scevgep, %scevgep145
  %bound1148 = icmp ult double* %scevgep143, %scevgep137
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %index
  %169 = bitcast double* %168 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %169, align 8, !alias.scope !20, !noalias !23
  %170 = getelementptr double, double* %168, i64 2
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !20, !noalias !23
  %172 = or i64 %index, 1
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %172
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !26
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !26
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %index
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !26
  %179 = getelementptr double, double* %177, i64 2
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !26
  %181 = fsub <2 x double> %wide.load152, %wide.load154
  %182 = fsub <2 x double> %wide.load153, %wide.load155
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next122, i64 %index
  %184 = bitcast double* %183 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %184, align 8, !alias.scope !27
  %185 = getelementptr double, double* %183, i64 2
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !27
  %187 = fadd <2 x double> %181, %wide.load156
  %188 = fadd <2 x double> %182, %wide.load157
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 %index
  %190 = bitcast double* %189 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %190, align 8, !alias.scope !27
  %191 = getelementptr double, double* %189, i64 2
  %192 = bitcast double* %191 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %192, align 8, !alias.scope !27
  %193 = fsub <2 x double> %187, %wide.load158
  %194 = fsub <2 x double> %188, %wide.load159
  %195 = fmul <2 x double> %193, <double 7.000000e-01, double 7.000000e-01>
  %196 = fmul <2 x double> %194, <double 7.000000e-01, double 7.000000e-01>
  %197 = fsub <2 x double> %wide.load, %195
  %198 = fsub <2 x double> %wide.load151, %196
  %199 = bitcast double* %168 to <2 x double>*
  store <2 x double> %197, <2 x double>* %199, align 8, !alias.scope !20, !noalias !23
  %200 = bitcast double* %170 to <2 x double>*
  store <2 x double> %198, <2 x double>* %200, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %201 = icmp eq i64 %index.next, %n.vec
  br i1 %201, label %middle.block, label %vector.body, !llvm.loop !28

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge84.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv117.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %scalar.ph ], [ %indvars.iv117.ph, %scalar.ph.preheader ]
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv121, i64 %indvars.iv117
  %203 = load double, double* %202, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %204 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv.next118
  %205 = load double, double* %204, align 8
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv121, i64 %indvars.iv117
  %207 = load double, double* %206, align 8
  %208 = fsub double %205, %207
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next122, i64 %indvars.iv117
  %210 = load double, double* %209, align 8
  %211 = fadd double %208, %210
  %212 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv121, i64 %indvars.iv117
  %213 = load double, double* %212, align 8
  %214 = fsub double %211, %213
  %215 = fmul double %214, 7.000000e-01
  %216 = fsub double %203, %215
  store double %216, double* %202, align 8
  %exitcond120 = icmp eq i64 %indvars.iv.next118, %wide.trip.count119
  br i1 %exitcond120, label %._crit_edge84.us.loopexit, label %scalar.ph, !llvm.loop !29

._crit_edge84.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge84.us

._crit_edge84.us:                                 ; preds = %._crit_edge84.us.loopexit, %middle.block
  %exitcond124 = icmp eq i64 %indvars.iv.next122, %wide.trip.count123
  br i1 %exitcond124, label %._crit_edge86.loopexit, label %.preheader.us

._crit_edge86.loopexit:                           ; preds = %._crit_edge84.us
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge86.loopexit, %.preheader70
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, %wide.trip.count127
  br i1 %exitcond128, label %._crit_edge88.loopexit, label %.preheader73

._crit_edge88.loopexit:                           ; preds = %._crit_edge86
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader41.us.preheader, label %._crit_edge54

.preheader41.us.preheader:                        ; preds = %5
  %12 = sext i32 %0 to i64
  %wide.trip.count74 = zext i32 %1 to i64
  %wide.trip.count78 = zext i32 %0 to i64
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge52.us, %.preheader41.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next77, %._crit_edge52.us ]
  %13 = mul nsw i64 %indvars.iv76, %12
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader41.us
  %indvars.iv72 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next73, %21 ]
  %15 = add nsw i64 %indvars.iv72, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv76, i64 %indvars.iv72
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge52.us, label %14

._crit_edge52.us:                                 ; preds = %21
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond79, label %._crit_edge54.loopexit, label %.preheader41.us

._crit_edge54.loopexit:                           ; preds = %._crit_edge52.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %32 = icmp sgt i32 %0, 0
  %33 = icmp sgt i32 %1, 0
  %or.cond81 = and i1 %32, %33
  br i1 %or.cond81, label %.preheader40.us.preheader, label %._crit_edge49

.preheader40.us.preheader:                        ; preds = %._crit_edge54
  %34 = sext i32 %0 to i64
  %wide.trip.count65 = zext i32 %1 to i64
  %wide.trip.count69 = zext i32 %0 to i64
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge47.us, %.preheader40.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.preheader40.us.preheader ], [ %indvars.iv.next68, %._crit_edge47.us ]
  %35 = mul nsw i64 %indvars.iv67, %34
  br label %36

; <label>:36:                                     ; preds = %43, %.preheader40.us
  %indvars.iv63 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next64, %43 ]
  %37 = add nsw i64 %indvars.iv63, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %36
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %42) #5
  br label %43

; <label>:43:                                     ; preds = %41, %36
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv67, i64 %indvars.iv63
  %46 = load double, double* %45, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %46) #5
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge47.us, label %36

._crit_edge47.us:                                 ; preds = %43
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge49.loopexit, label %.preheader40.us

._crit_edge49.loopexit:                           ; preds = %._crit_edge47.us
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %._crit_edge54
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  %52 = icmp sgt i32 %0, 0
  %53 = icmp sgt i32 %1, 0
  %or.cond82 = and i1 %52, %53
  br i1 %or.cond82, label %.preheader.us.preheader, label %._crit_edge44

.preheader.us.preheader:                          ; preds = %._crit_edge49
  %54 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count60 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv58 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next59, %._crit_edge.us ]
  %55 = mul nsw i64 %indvars.iv58, %54
  br label %56

; <label>:56:                                     ; preds = %63, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %63 ]
  %57 = add nsw i64 %indvars.iv, %55
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 20
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %63

; <label>:61:                                     ; preds = %56
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %62) #5
  br label %63

; <label>:63:                                     ; preds = %61, %56
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %64, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %66) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %56

._crit_edge.us:                                   ; preds = %63
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge44.loopexit, label %.preheader.us

._crit_edge44.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %._crit_edge49
  %68 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %69 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %68, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
