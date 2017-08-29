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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #5
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph57, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %5
  br label %._crit_edge70

.lr.ph57:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter201 = and i64 %11, 1
  %lcmp.mod202 = icmp eq i64 %xtraiter201, 0
  br i1 %lcmp.mod202, label %._crit_edge69.prol.loopexit, label %._crit_edge69.prol.preheader

._crit_edge69.prol.preheader:                     ; preds = %.lr.ph57
  br label %._crit_edge69.prol

._crit_edge69.prol:                               ; preds = %._crit_edge69.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge69.prol.loopexit

._crit_edge69.prol.loopexit:                      ; preds = %.lr.ph57, %._crit_edge69.prol
  %indvars.iv131.unr = phi i64 [ 0, %.lr.ph57 ], [ 1, %._crit_edge69.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge, label %.lr.ph57.new

.lr.ph57.new:                                     ; preds = %._crit_edge69.prol.loopexit
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph57.new
  %indvars.iv131 = phi i64 [ %indvars.iv131.unr, %.lr.ph57.new ], [ %indvars.iv.next132.1, %._crit_edge69 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv131
  %19 = bitcast double* %18 to <2 x double>*
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %20 = trunc i64 %indvars.iv.next132 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %indvars.iv.next132.1 = add nuw nsw i64 %indvars.iv131, 2
  %23 = trunc i64 %indvars.iv.next132.1 to i32
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %9, i32 0
  %26 = insertelement <2 x double> %25, double %9, i32 1
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fdiv <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %22 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %33 = icmp slt i64 %indvars.iv.next132.1, %11
  br i1 %33, label %._crit_edge69, label %._crit_edge.unr-lcssa

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge69
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge69.prol.loopexit, %._crit_edge.unr-lcssa
  br i1 true, label %.lr.ph50, label %._crit_edge.._crit_edge70_crit_edge

._crit_edge.._crit_edge70_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge70

.lr.ph50:                                         ; preds = %._crit_edge
  %34 = add i32 %0, -2
  %35 = zext i32 %34 to i64
  br label %36

; <label>:36:                                     ; preds = %._crit_edge46._crit_edge, %.lr.ph50
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50 ]
  %indvars.iv116 = phi i32 [ %indvars.iv.next117, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50 ]
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %sext = shl i64 %indvars.iv.next130, 32
  %37 = ashr exact i64 %sext, 32
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %37
  %38 = sub i64 %35, %indvars.iv129
  %39 = shl i64 %38, 3
  %40 = and i64 %39, 34359738360
  %41 = add nuw nsw i64 %40, 8
  %42 = icmp sgt i64 %indvars.iv129, -1
  br i1 %42, label %.lr.ph40.preheader, label %._crit_edge41

.lr.ph40.preheader:                               ; preds = %36
  %wide.trip.count118 = zext i32 %indvars.iv116 to i64
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40, %.lr.ph40.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %.lr.ph40 ], [ 0, %.lr.ph40.preheader ]
  %43 = sub nsw i64 0, %indvars.iv112
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = fadd double %47, 1.000000e+00
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv112
  store double %48, double* %49, align 8
  %exitcond119 = icmp eq i64 %indvars.iv112, %wide.trip.count118
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br i1 %exitcond119, label %._crit_edge41.loopexit, label %.lr.ph40

._crit_edge41.loopexit:                           ; preds = %.lr.ph40
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %36
  %50 = icmp slt i64 %indvars.iv.next130, %11
  br i1 %50, label %.._crit_edge46_crit_edge, label %._crit_edge46

.._crit_edge46_crit_edge:                         ; preds = %._crit_edge41
  %51 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %51, i8 0, i64 %41, i32 8, i1 false)
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge41, %.._crit_edge46_crit_edge
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %52, align 8
  br i1 %50, label %._crit_edge46._crit_edge, label %._crit_edge51

._crit_edge46._crit_edge:                         ; preds = %._crit_edge46
  %indvars.iv.next117 = add i32 %indvars.iv116, 1
  br label %36

._crit_edge51:                                    ; preds = %._crit_edge46
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge.._crit_edge70_crit_edge, %._crit_edge.thread, %._crit_edge51
  %53 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %54 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %53, i8** %54, align 8
  %55 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br i1 %10, label %.lr.ph33, label %._crit_edge74.thread

._crit_edge74.thread:                             ; preds = %._crit_edge70
  br label %._crit_edge76

.lr.ph33:                                         ; preds = %._crit_edge70
  %56 = sext i32 %0 to i64
  br i1 true, label %.lr.ph33..lr.ph33.split.us_crit_edge, label %.lr.ph33.split.._crit_edge34_crit_edge

.lr.ph33..lr.ph33.split.us_crit_edge:             ; preds = %.lr.ph33
  %57 = add i32 %0, -1
  %58 = zext i32 %57 to i64
  %59 = shl nuw nsw i64 %58, 3
  %60 = add nuw nsw i64 %59, 8
  %61 = add nsw i64 %56, -1
  %xtraiter198 = and i64 %56, 3
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod199, label %._crit_edge29.us.prol.loopexit, label %._crit_edge29.us.prol.preheader

._crit_edge29.us.prol.preheader:                  ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge
  br label %._crit_edge29.us.prol

._crit_edge29.us.prol:                            ; preds = %._crit_edge29.us.prol, %._crit_edge29.us.prol.preheader
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %prol.iter200 = phi i64 [ %prol.iter200.sub, %._crit_edge29.us.prol ], [ %xtraiter198, %._crit_edge29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv109.prol, i64 0
  %scevgep108.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.prol, i8 0, i64 %60, i32 8, i1 false)
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter200.sub = add nsw i64 %prol.iter200, -1
  %prol.iter200.cmp = icmp eq i64 %prol.iter200.sub, 0
  br i1 %prol.iter200.cmp, label %._crit_edge29.us.prol.loopexit.unr-lcssa, label %._crit_edge29.us.prol, !llvm.loop !1

._crit_edge29.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge29.us.prol
  br label %._crit_edge29.us.prol.loopexit

._crit_edge29.us.prol.loopexit:                   ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge, %._crit_edge29.us.prol.loopexit.unr-lcssa
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %xtraiter198, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %xtraiter198, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %61, 3
  br i1 %62, label %._crit_edge29.us.._crit_edge34_crit_edge, label %.lr.ph33..lr.ph33.split.us_crit_edge.new

.lr.ph33..lr.ph33.split.us_crit_edge.new:         ; preds = %._crit_edge29.us.prol.loopexit
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33..lr.ph33.split.us_crit_edge.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvars.iv.next110.3, %._crit_edge29.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 %60, i32 8, i1 false)
  %indvars.iv.next110.3 = add i64 %indvars.iv109, 4
  %63 = icmp slt i64 %indvars.iv.next110.3, %56
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %63, label %._crit_edge29.us, label %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa

._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa: ; preds = %._crit_edge29.us
  br label %._crit_edge29.us.._crit_edge34_crit_edge

._crit_edge29.us.._crit_edge34_crit_edge:         ; preds = %._crit_edge29.us.prol.loopexit, %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa
  %.pr139.pre = load i32, i32* %6, align 4
  br label %._crit_edge74

.lr.ph33.split.._crit_edge34_crit_edge:           ; preds = %.lr.ph33
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge29.us.._crit_edge34_crit_edge, %.lr.ph33.split.._crit_edge34_crit_edge
  %64 = phi i32 [ %.pr139.pre, %._crit_edge29.us.._crit_edge34_crit_edge ], [ %0, %.lr.ph33.split.._crit_edge34_crit_edge ]
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph20, label %._crit_edge76.thread

._crit_edge76.thread:                             ; preds = %._crit_edge74
  %.pre = load i8*, i8** %54, align 8
  br label %._crit_edge78

.lr.ph20:                                         ; preds = %._crit_edge74
  %66 = sext i32 %64 to i64
  %67 = load [2000 x double]*, [2000 x double]** %7, align 8
  %68 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %69 = bitcast [2000 x [2000 x double]]* %68 to i8*
  br i1 true, label %.lr.ph20.split.us, label %.lr.ph20.split.._crit_edge21_crit_edge

.lr.ph20.split.us:                                ; preds = %.lr.ph20
  %70 = add i32 %64, -1
  %wide.trip.count99 = zext i32 %70 to i64
  %71 = add nuw nsw i64 %wide.trip.count99, 1
  %72 = add nuw nsw i64 %wide.trip.count99, 1
  %min.iters.check = icmp ult i64 %71, 4
  %n.vec = and i64 %71, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %71, %n.vec
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us, %.lr.ph20.split.us
  %indvar145 = phi i64 [ %73, %._crit_edge14.us ], [ 0, %.lr.ph20.split.us ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %67, i64 0, i64 %indvar145
  %73 = add nuw nsw i64 %indvar145, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %67, i64 %wide.trip.count99, i64 %73
  br i1 true, label %.lr.ph9.us.us.preheader, label %.lr.ph13.us.._crit_edge14.us_crit_edge

.lr.ph13.us.._crit_edge14.us_crit_edge:           ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

.lr.ph9.us.us.preheader:                          ; preds = %.lr.ph13.us
  br label %.lr.ph9.us.us

._crit_edge14.us:                                 ; preds = %.lr.ph13.us.._crit_edge14.us_crit_edge, %._crit_edge10.us.us.._crit_edge14.us_crit_edge
  %exitcond204 = icmp ne i64 %73, %66
  br i1 %exitcond204, label %.lr.ph13.us, label %._crit_edge14.us.._crit_edge21_crit_edge

._crit_edge14.us.._crit_edge21_crit_edge:         ; preds = %._crit_edge14.us
  br label %._crit_edge21

.lr.ph9.us.us:                                    ; preds = %.lr.ph9.us.us.preheader, %._crit_edge10.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge10.us.us ], [ 0, %.lr.ph9.us.us.preheader ]
  %scevgep141 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 0
  %scevgep143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 %71
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv101, i64 %indvar145
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.us.us
  %indvars.iv97.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9.us.us ], [ %n.vec, %middle.block ]
  %75 = sub nsw i64 %72, %indvars.iv97.ph
  %xtraiter196 = and i64 %75, 1
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %76 = load double, double* %74, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv97.ph, i64 %indvar145
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 %indvars.iv97.ph
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  store double %82, double* %80, align 8
  %indvars.iv.next98.prol = or i64 %indvars.iv97.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv97.unr.ph = phi i64 [ %indvars.iv.next98.prol, %scalar.ph.prol ], [ %indvars.iv97.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %83 = icmp eq i64 %wide.trip.count99, %indvars.iv97.ph
  br i1 %83, label %._crit_edge10.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph9.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep141, %scevgep149
  %bound1 = icmp ult double* %scevgep147, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bound0152 = icmp ult double* %scevgep141, %74
  %bound1153 = icmp ult double* %74, %scevgep143
  %found.conflict154 = and i1 %bound0152, %bound1153
  %conflict.rdx = or i1 %found.conflict, %found.conflict154
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %84 = or i64 %index, 1
  %85 = or i64 %index, 2
  %86 = or i64 %index, 3
  %87 = load double, double* %74, align 8, !alias.scope !3
  %88 = insertelement <2 x double> undef, double %87, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %index, i64 %indvar145
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %84, i64 %indvar145
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %85, i64 %indvar145
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %86, i64 %indvar145
  %94 = load double, double* %90, align 8, !alias.scope !6
  %95 = load double, double* %91, align 8, !alias.scope !6
  %96 = load double, double* %92, align 8, !alias.scope !6
  %97 = load double, double* %93, align 8, !alias.scope !6
  %98 = insertelement <2 x double> undef, double %94, i32 0
  %99 = insertelement <2 x double> %98, double %95, i32 1
  %100 = insertelement <2 x double> undef, double %96, i32 0
  %101 = insertelement <2 x double> %100, double %97, i32 1
  %102 = fmul <2 x double> %89, %99
  %103 = fmul <2 x double> %89, %101
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 %index
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !8, !noalias !10
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  %108 = fadd <2 x double> %wide.load, %102
  %109 = fadd <2 x double> %wide.load156, %103
  store <2 x double> %108, <2 x double>* %105, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %109, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %110 = icmp eq i64 %index.next, %n.vec
  br i1 %110, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10.us.us, label %scalar.ph.preheader

._crit_edge10.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge10.us.us.loopexit

._crit_edge10.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge10.us.us.loopexit.unr-lcssa
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %middle.block
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond203 = icmp ne i64 %indvars.iv.next102, %66
  br i1 %exitcond203, label %.lr.ph9.us.us, label %._crit_edge10.us.us.._crit_edge14.us_crit_edge

._crit_edge10.us.us.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge10.us.us
  br label %._crit_edge14.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next98.1, %scalar.ph ]
  %111 = load double, double* %74, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv97, i64 %indvar145
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %114
  store double %117, double* %115, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %118 = load double, double* %74, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv.next98, i64 %indvar145
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %123 = load double, double* %122, align 8
  %124 = fadd double %123, %121
  store double %124, double* %122, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %._crit_edge10.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.lr.ph20.split.._crit_edge21_crit_edge:           ; preds = %.lr.ph20
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.lr.ph20.split.._crit_edge21_crit_edge, %._crit_edge14.us.._crit_edge21_crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge74.thread, %._crit_edge21
  %125 = phi i8* [ %53, %._crit_edge74.thread ], [ %69, %._crit_edge21 ]
  %126 = phi [2000 x double]* [ %1, %._crit_edge74.thread ], [ %67, %._crit_edge21 ]
  %127 = phi [2000 x [2000 x double]]* [ %55, %._crit_edge74.thread ], [ %68, %._crit_edge21 ]
  %128 = phi i32 [ %0, %._crit_edge74.thread ], [ %64, %._crit_edge21 ]
  %129 = icmp sgt i32 %128, 0
  br i1 %129, label %.lr.ph2, label %._crit_edge78

.lr.ph2:                                          ; preds = %._crit_edge76
  %130 = sext i32 %128 to i64
  br i1 true, label %.lr.ph2..lr.ph2.split.us_crit_edge, label %.lr.ph2.split.._crit_edge3_crit_edge

.lr.ph2..lr.ph2.split.us_crit_edge:               ; preds = %.lr.ph2
  %131 = add i32 %128, -1
  %wide.trip.count93 = zext i32 %131 to i64
  %132 = add nuw nsw i64 %wide.trip.count93, 1
  %133 = and i64 %132, 8589934588
  %134 = add nsw i64 %133, -4
  %135 = lshr exact i64 %134, 2
  %136 = add nuw nsw i64 %wide.trip.count93, 1
  %min.iters.check160 = icmp ult i64 %132, 4
  %n.vec163 = and i64 %132, 8589934588
  %cmp.zero164 = icmp eq i64 %n.vec163, 0
  %137 = and i64 %135, 1
  %lcmp.mod = icmp eq i64 %137, 0
  %138 = icmp eq i64 %135, 0
  %cmp.n185 = icmp eq i64 %132, %n.vec163
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2..lr.ph2.split.us_crit_edge
  %indvar166 = phi i64 [ %indvar.next167, %._crit_edge.us ], [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ]
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 0
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %132
  %scevgep172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 0
  %scevgep174 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %132
  br i1 %min.iters.check160, label %scalar.ph159.preheader, label %min.iters.checked161

min.iters.checked161:                             ; preds = %.lr.ph2.split.us
  br i1 %cmp.zero164, label %scalar.ph159.preheader, label %vector.memcheck180

vector.memcheck180:                               ; preds = %min.iters.checked161
  %bound0176 = icmp ult double* %scevgep168, %scevgep174
  %bound1177 = icmp ult double* %scevgep172, %scevgep170
  %memcheck.conflict179 = and i1 %bound0176, %bound1177
  br i1 %memcheck.conflict179, label %scalar.ph159.preheader, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %vector.memcheck180
  br i1 %lcmp.mod, label %vector.body157.prol.preheader, label %vector.body157.prol.loopexit.unr-lcssa

vector.body157.prol.preheader:                    ; preds = %vector.body157.preheader
  br label %vector.body157.prol

vector.body157.prol:                              ; preds = %vector.body157.prol.preheader
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 0
  %140 = bitcast double* %139 to <2 x i64>*
  %wide.load190.prol = load <2 x i64>, <2 x i64>* %140, align 8, !alias.scope !15
  %141 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 2
  %142 = bitcast double* %141 to <2 x i64>*
  %wide.load191.prol = load <2 x i64>, <2 x i64>* %142, align 8, !alias.scope !15
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 0
  %144 = bitcast double* %143 to <2 x i64>*
  store <2 x i64> %wide.load190.prol, <2 x i64>* %144, align 8, !alias.scope !18, !noalias !15
  %145 = getelementptr [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 2
  %146 = bitcast double* %145 to <2 x i64>*
  store <2 x i64> %wide.load191.prol, <2 x i64>* %146, align 8, !alias.scope !18, !noalias !15
  br label %vector.body157.prol.loopexit.unr-lcssa

vector.body157.prol.loopexit.unr-lcssa:           ; preds = %vector.body157.preheader, %vector.body157.prol
  %index182.unr.ph = phi i64 [ 4, %vector.body157.prol ], [ 0, %vector.body157.preheader ]
  br label %vector.body157.prol.loopexit

vector.body157.prol.loopexit:                     ; preds = %vector.body157.prol.loopexit.unr-lcssa
  br i1 %138, label %middle.block158, label %vector.body157.preheader.new

vector.body157.preheader.new:                     ; preds = %vector.body157.prol.loopexit
  br label %vector.body157

vector.body157:                                   ; preds = %vector.body157, %vector.body157.preheader.new
  %index182 = phi i64 [ %index182.unr.ph, %vector.body157.preheader.new ], [ %index.next183.1, %vector.body157 ]
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %index182
  %148 = bitcast double* %147 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !15
  %149 = getelementptr double, double* %147, i64 2
  %150 = bitcast double* %149 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %150, align 8, !alias.scope !15
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %index182
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %152, align 8, !alias.scope !18, !noalias !15
  %153 = getelementptr double, double* %151, i64 2
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %154, align 8, !alias.scope !18, !noalias !15
  %index.next183 = add i64 %index182, 4
  %155 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %index.next183
  %156 = bitcast double* %155 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %156, align 8, !alias.scope !15
  %157 = getelementptr double, double* %155, i64 2
  %158 = bitcast double* %157 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %158, align 8, !alias.scope !15
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %index.next183
  %160 = bitcast double* %159 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %160, align 8, !alias.scope !18, !noalias !15
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %162, align 8, !alias.scope !18, !noalias !15
  %index.next183.1 = add i64 %index182, 8
  %163 = icmp eq i64 %index.next183.1, %n.vec163
  br i1 %163, label %middle.block158.unr-lcssa, label %vector.body157, !llvm.loop !20

middle.block158.unr-lcssa:                        ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %vector.body157.prol.loopexit, %middle.block158.unr-lcssa
  br i1 %cmp.n185, label %._crit_edge.us, label %scalar.ph159.preheader

scalar.ph159.preheader:                           ; preds = %middle.block158, %vector.memcheck180, %min.iters.checked161, %.lr.ph2.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck180 ], [ 0, %min.iters.checked161 ], [ 0, %.lr.ph2.split.us ], [ %n.vec163, %middle.block158 ]
  %164 = sub nsw i64 %136, %indvars.iv.ph
  %165 = sub nsw i64 %wide.trip.count93, %indvars.iv.ph
  %xtraiter194 = and i64 %164, 3
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %scalar.ph159.prol.loopexit, label %scalar.ph159.prol.preheader

scalar.ph159.prol.preheader:                      ; preds = %scalar.ph159.preheader
  br label %scalar.ph159.prol

scalar.ph159.prol:                                ; preds = %scalar.ph159.prol, %scalar.ph159.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph159.prol ], [ %indvars.iv.ph, %scalar.ph159.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph159.prol ], [ %xtraiter194, %scalar.ph159.prol.preheader ]
  %166 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %indvars.iv.prol
  %167 = bitcast double* %166 to i64*
  %168 = load i64, i64* %167, align 8
  %169 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %indvars.iv.prol
  %170 = bitcast double* %169 to i64*
  store i64 %168, i64* %170, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph159.prol.loopexit.unr-lcssa, label %scalar.ph159.prol, !llvm.loop !21

scalar.ph159.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph159.prol
  %171 = add i64 %indvars.iv.ph, %xtraiter194
  br label %scalar.ph159.prol.loopexit

scalar.ph159.prol.loopexit:                       ; preds = %scalar.ph159.preheader, %scalar.ph159.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph159.preheader ], [ %171, %scalar.ph159.prol.loopexit.unr-lcssa ]
  %172 = icmp ult i64 %165, 3
  br i1 %172, label %._crit_edge.us.loopexit, label %scalar.ph159.preheader.new

scalar.ph159.preheader.new:                       ; preds = %scalar.ph159.prol.loopexit
  br label %scalar.ph159

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph159.preheader.new ], [ %indvars.iv.next.3, %scalar.ph159 ]
  %173 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %indvars.iv
  %174 = bitcast double* %173 to i64*
  %175 = load i64, i64* %174, align 8
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %indvars.iv
  %177 = bitcast double* %176 to i64*
  store i64 %175, i64* %177, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %178 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %indvars.iv.next
  %179 = bitcast double* %178 to i64*
  %180 = load i64, i64* %179, align 8
  %181 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %indvars.iv.next
  %182 = bitcast double* %181 to i64*
  store i64 %180, i64* %182, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %183 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %indvars.iv.next.1
  %184 = bitcast double* %183 to i64*
  %185 = load i64, i64* %184, align 8
  %186 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %indvars.iv.next.1
  %187 = bitcast double* %186 to i64*
  store i64 %185, i64* %187, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %188 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %127, i64 0, i64 %indvar166, i64 %indvars.iv.next.2
  %189 = bitcast double* %188 to i64*
  %190 = load i64, i64* %189, align 8
  %191 = getelementptr inbounds [2000 x double], [2000 x double]* %126, i64 %indvar166, i64 %indvars.iv.next.2
  %192 = bitcast double* %191 to i64*
  store i64 %190, i64* %192, align 8
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count93
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph159, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph159
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph159.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block158
  %indvar.next167 = add nuw nsw i64 %indvar166, 1
  %exitcond = icmp ne i64 %indvar.next167, %130
  br i1 %exitcond, label %.lr.ph2.split.us, label %._crit_edge.us.._crit_edge3_crit_edge

._crit_edge.us.._crit_edge3_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge3

.lr.ph2.split.._crit_edge3_crit_edge:             ; preds = %.lr.ph2
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.lr.ph2.split.._crit_edge3_crit_edge, %._crit_edge.us.._crit_edge3_crit_edge
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge76, %._crit_edge76.thread, %._crit_edge3
  %193 = phi i8* [ %125, %._crit_edge76 ], [ %.pre, %._crit_edge76.thread ], [ %125, %._crit_edge3 ]
  call void @free(i8* %193) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph56, label %._crit_edge69

.lr.ph56:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count120 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count120, 1
  %10 = trunc i32 %0 to i3
  br label %11

; <label>:11:                                     ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv187 = phi i3 [ %indvars.iv.next188, %._crit_edge48 ], [ %10, %.lr.ph56 ]
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge48 ], [ 0, %.lr.ph56 ]
  %indvars.iv129 = phi i32 [ %18, %._crit_edge48 ], [ -1, %.lr.ph56 ]
  %12 = zext i3 %indvars.iv187 to i64
  %13 = add i64 %indvars.iv185, %12
  %14 = add nuw nsw i64 %indvars.iv185, 4294967295
  %15 = and i64 %14, 4294967295
  %16 = sub nsw i64 %9, %indvars.iv185
  %17 = sub nsw i64 %wide.trip.count120, %indvars.iv185
  %18 = add nsw i32 %indvars.iv129, 1
  %19 = icmp sgt i64 %indvars.iv185, 0
  br i1 %19, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %11
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 0
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %._crit_edge27
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv110 = phi i32 [ %23, %._crit_edge27 ], [ -1, %.lr.ph32.preheader ]
  %21 = add nuw nsw i64 %indvars.iv114, 4294967295
  %22 = and i64 %21, 4294967295
  %23 = add nsw i32 %indvars.iv110, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv114
  %25 = load double, double* %24, align 8
  %26 = icmp sgt i64 %indvars.iv114, 0
  br i1 %26, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %27 = and i64 %21, 1
  %lcmp.mod159 = icmp eq i64 %27, 0
  br i1 %lcmp.mod159, label %.lr.ph26.prol.preheader, label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.preheader:                          ; preds = %.lr.ph26.preheader
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol.preheader
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %25, %31
  br label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph26.preheader, %.lr.ph26.prol
  %.lcssa152.unr.ph = phi double [ %32, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr160.ph = phi double [ %32, %.lr.ph26.prol ], [ %25, %.lr.ph26.preheader ]
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %22, 0
  br i1 %33, label %._crit_edge27.loopexit, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %34 = phi double [ %.unr160.ph, %.lr.ph26.preheader.new ], [ %48, %.lr.ph26 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv104
  %36 = bitcast double* %35 to <2 x double>*
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %38 = load double, double* %37, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %39 = load <2 x double>, <2 x double>* %36, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %41 = load double, double* %40, align 8
  %42 = insertelement <2 x double> undef, double %38, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  %44 = fmul <2 x double> %39, %43
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  %47 = fsub double %34, %45
  %48 = fsub double %47, %46
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %wide.trip.count112
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge27.loopexit.unr-lcssa, label %.lr.ph26

._crit_edge27.loopexit.unr-lcssa:                 ; preds = %.lr.ph26
  br label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26.prol.loopexit, %._crit_edge27.loopexit.unr-lcssa
  %.lcssa152 = phi double [ %.lcssa152.unr.ph, %.lr.ph26.prol.loopexit ], [ %48, %._crit_edge27.loopexit.unr-lcssa ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %25, %.lr.ph32 ], [ %.lcssa152, %._crit_edge27.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %50 = load double, double* %49, align 8
  %51 = fdiv double %.lcssa3038, %50
  store double %51, double* %24, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond183 = icmp ne i64 %indvars.iv.next115, %indvars.iv185
  br i1 %exitcond183, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge27
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %11
  br i1 true, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge33
  br i1 %19, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter161 = and i64 %16, 7
  %lcmp.mod162 = icmp eq i64 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %prol.iter163 = phi i64 [ %prol.iter163.sub, %.lr.ph47.split.prol ], [ %xtraiter161, %.lr.ph47.split.prol.preheader ]
  %prol.iter163.sub = add nsw i64 %prol.iter163, -1
  %prol.iter163.cmp = icmp eq i64 %prol.iter163.sub, 0
  br i1 %prol.iter163.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !23

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv185, %.lr.ph47.split.preheader ], [ %13, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %52 = icmp ult i64 %17, 7
  br i1 %52, label %.lr.ph47.split.._crit_edge48_crit_edge, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %53 = and i64 %14, 1
  %lcmp.mod167 = icmp eq i64 %53, 0
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 0
  %55 = icmp eq i64 %15, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv185, %.lr.ph47.split.us.preheader ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv135
  %57 = load double, double* %56, align 8
  br i1 %lcmp.mod167, label %.prol.preheader164, label %.prol.loopexit165.unr-lcssa

.prol.preheader164:                               ; preds = %.lr.ph47.split.us
  br label %58

; <label>:58:                                     ; preds = %.prol.preheader164
  %59 = load double, double* %54, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fsub double %57, %62
  br label %.prol.loopexit165.unr-lcssa

.prol.loopexit165.unr-lcssa:                      ; preds = %.lr.ph47.split.us, %58
  %.lcssa153.unr.ph = phi double [ %63, %58 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %58 ], [ 0, %.lr.ph47.split.us ]
  %.unr168.ph = phi double [ %63, %58 ], [ %57, %.lr.ph47.split.us ]
  br label %.prol.loopexit165

.prol.loopexit165:                                ; preds = %.prol.loopexit165.unr-lcssa
  br i1 %55, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit165
  br label %64

; <label>:64:                                     ; preds = %64, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %64 ]
  %65 = phi double [ %.unr168.ph, %.lr.ph47.split.us.new ], [ %79, %64 ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv123
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %69 = load double, double* %68, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %70 = load <2 x double>, <2 x double>* %67, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %72 = load double, double* %71, align 8
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = fmul <2 x double> %70, %74
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fsub double %65, %76
  %79 = fsub double %78, %77
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge41.us.unr-lcssa, label %64

._crit_edge41.us.unr-lcssa:                       ; preds = %64
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit165, %._crit_edge41.us.unr-lcssa
  %.lcssa153 = phi double [ %.lcssa153.unr.ph, %.prol.loopexit165 ], [ %79, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa153, double* %56, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond184 = icmp ne i64 %indvars.iv.next136, %8
  br i1 %exitcond184, label %.lr.ph47.split.us, label %._crit_edge48.loopexit

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph47.split ]
  %indvars.iv.next119.6 = add i64 %indvars.iv118, 7
  %exitcond121.7 = icmp eq i64 %indvars.iv.next119.6, %wide.trip.count120
  %indvars.iv.next119.7 = add i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa, label %.lr.ph47.split

.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa: ; preds = %.lr.ph47.split
  br label %.lr.ph47.split.._crit_edge48_crit_edge

.lr.ph47.split.._crit_edge48_crit_edge:           ; preds = %.lr.ph47.split.prol.loopexit, %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa
  br label %._crit_edge48

._crit_edge48.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge33, %.lr.ph47.split.._crit_edge48_crit_edge
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %indvars.iv.next188 = add i3 %indvars.iv187, -1
  %exitcond189 = icmp ne i64 %indvars.iv.next186, %8
  br i1 %exitcond189, label %11, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge48
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %5, %._crit_edge57
  br i1 %6, label %.lr.ph18, label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge69
  br label %._crit_edge76

.lr.ph18:                                         ; preds = %._crit_edge69
  %80 = sext i32 %0 to i64
  br label %81

; <label>:81:                                     ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv = phi i2 [ %indvars.iv.next, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %82 = zext i2 %indvars.iv to i64
  %83 = add nuw nsw i64 %indvars.iv102, 4294967295
  %84 = and i64 %83, 4294967295
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %86 = load double, double* %85, align 8
  %87 = icmp sgt i64 %indvars.iv102, 0
  br i1 %87, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %81
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter154 = and i64 %indvars.iv102, 3
  %lcmp.mod155 = icmp eq i64 %xtraiter154, 0
  br i1 %lcmp.mod155, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %.lr.ph12.preheader
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol, %.lr.ph12.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %88 = phi double [ %94, %.lr.ph12.prol ], [ %86, %.lr.ph12.prol.preheader ]
  %prol.iter156 = phi i64 [ %prol.iter156.sub, %.lr.ph12.prol ], [ %xtraiter154, %.lr.ph12.prol.preheader ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fsub double %88, %93
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter156.sub = add nsw i64 %prol.iter156, -1
  %prol.iter156.cmp = icmp eq i64 %prol.iter156.sub, 0
  br i1 %prol.iter156.cmp, label %.lr.ph12.prol.loopexit.unr-lcssa, label %.lr.ph12.prol, !llvm.loop !24

.lr.ph12.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol.loopexit.unr-lcssa
  %.lcssa151.unr = phi double [ undef, %.lr.ph12.preheader ], [ %94, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %82, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %.unr157 = phi double [ %86, %.lr.ph12.preheader ], [ %94, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %95 = icmp ult i64 %84, 3
  br i1 %95, label %._crit_edge13.loopexit, label %.lr.ph12.preheader.new

.lr.ph12.preheader.new:                           ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12, %.lr.ph12.preheader.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph12.preheader.new ], [ %indvars.iv.next93.3, %.lr.ph12 ]
  %96 = phi double [ %.unr157, %.lr.ph12.preheader.new ], [ %118, %.lr.ph12 ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %98 = bitcast double* %97 to <2 x double>*
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %98, align 8
  %102 = load <2 x double>, <2 x double>* %100, align 8
  %103 = fmul <2 x double> %101, %102
  %104 = extractelement <2 x double> %103, i32 0
  %105 = extractelement <2 x double> %103, i32 1
  %106 = fsub double %96, %104
  %107 = fsub double %106, %105
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %109 = bitcast double* %108 to <2 x double>*
  %110 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %111 = bitcast double* %110 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %112 = load <2 x double>, <2 x double>* %109, align 8
  %113 = load <2 x double>, <2 x double>* %111, align 8
  %114 = fmul <2 x double> %112, %113
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  %117 = fsub double %107, %115
  %118 = fsub double %117, %116
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge13.loopexit.unr-lcssa, label %.lr.ph12

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %.lr.ph12
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  %.lcssa151 = phi double [ %.lcssa151.unr, %.lr.ph12.prol.loopexit ], [ %118, %._crit_edge13.loopexit.unr-lcssa ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %81
  %.lcssa1624 = phi double [ %86, %81 ], [ %.lcssa151, %._crit_edge13.loopexit ]
  %119 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  store double %.lcssa1624, double* %119, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %indvars.iv.next99 = add nsw i32 %indvars.iv98, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next103, %80
  br i1 %exitcond, label %81, label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge13
  br i1 true, label %.lr.ph4, label %._crit_edge73.._crit_edge76_crit_edge

._crit_edge73.._crit_edge76_crit_edge:            ; preds = %._crit_edge73
  br label %._crit_edge76

.lr.ph4:                                          ; preds = %._crit_edge73
  %120 = add i32 %0, -1
  %121 = sext i32 %120 to i64
  %122 = add nsw i64 %121, 1
  br label %123

; <label>:123:                                    ; preds = %._crit_edge, %.lr.ph4
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge ], [ 0, %.lr.ph4 ]
  %indvars.iv177 = phi i2 [ %indvars.iv.next178, %._crit_edge ], [ 0, %.lr.ph4 ]
  %indvars.iv175 = phi i32 [ %indvars.iv.next176, %._crit_edge ], [ %0, %.lr.ph4 ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge ], [ %121, %.lr.ph4 ]
  %124 = sext i32 %indvars.iv175 to i64
  %125 = zext i2 %indvars.iv177 to i64
  %126 = add i64 %124, %125
  %127 = trunc i64 %indvars.iv179 to i32
  %128 = sub i32 %0, %127
  %129 = sext i32 %128 to i64
  %130 = sub nsw i64 %121, %129
  %131 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %132 = load double, double* %131, align 8
  %133 = add nsw i64 %indvars.iv90, 1
  %134 = icmp slt i64 %133, %80
  br i1 %134, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %123
  %135 = sub nsw i64 %122, %129
  %136 = sext i32 %indvars.iv175 to i64
  %xtraiter = and i64 %135, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %137

; <label>:137:                                    ; preds = %137, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %137 ], [ %136, %.prol.preheader ]
  %138 = phi double [ %144, %137 ], [ %132, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %137 ], [ %xtraiter, %.prol.preheader ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds double, double* %3, i64 %indvars.iv88.prol
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = fsub double %138, %143
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %137, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %137
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %indvars.iv88.unr = phi i64 [ %136, %.lr.ph ], [ %126, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %132, %.lr.ph ], [ %144, %.prol.loopexit.unr-lcssa ]
  %145 = icmp ult i64 %130, 3
  br i1 %145, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %146

; <label>:146:                                    ; preds = %146, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %146 ]
  %147 = phi double [ %.unr, %.lr.ph.new ], [ %169, %146 ]
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88
  %149 = bitcast double* %148 to <2 x double>*
  %150 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  %151 = bitcast double* %150 to <2 x double>*
  %152 = load <2 x double>, <2 x double>* %149, align 8
  %153 = load <2 x double>, <2 x double>* %151, align 8
  %154 = fmul <2 x double> %152, %153
  %155 = extractelement <2 x double> %154, i32 0
  %156 = extractelement <2 x double> %154, i32 1
  %157 = fsub double %147, %155
  %158 = fsub double %157, %156
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %160 = bitcast double* %159 to <2 x double>*
  %161 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next89.1
  %162 = bitcast double* %161 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %163 = load <2 x double>, <2 x double>* %160, align 8
  %164 = load <2 x double>, <2 x double>* %162, align 8
  %165 = fmul <2 x double> %163, %164
  %166 = extractelement <2 x double> %165, i32 0
  %167 = extractelement <2 x double> %165, i32 1
  %168 = fsub double %158, %166
  %169 = fsub double %168, %167
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, %121
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %146

._crit_edge.loopexit.unr-lcssa:                   ; preds = %146
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %169, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %123
  %.lcssa210 = phi double [ %132, %123 ], [ %.lcssa, %._crit_edge.loopexit ]
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv90
  %171 = load double, double* %170, align 8
  %172 = fdiv double %.lcssa210, %171
  %173 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double %172, double* %173, align 8
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, -1
  %174 = icmp sgt i64 %indvars.iv90, 0
  %indvars.iv.next176 = add i32 %indvars.iv175, -1
  %indvars.iv.next178 = add i2 %indvars.iv177, 1
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  br i1 %174, label %123, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge73.._crit_edge76_crit_edge, %._crit_edge73.thread, %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %8
  br i1 %exitcond, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
