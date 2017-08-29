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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
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
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
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
  %indvar124 = phi i64 [ %37, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50 ]
  %indvars.iv116 = phi i32 [ %indvars.iv.next117, %._crit_edge46._crit_edge ], [ 0, %.lr.ph50 ]
  %37 = add i64 %indvar124, 1
  %sext = shl i64 %37, 32
  %38 = ashr exact i64 %sext, 32
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar124, i64 %38
  %39 = sub i64 %35, %indvar124
  %40 = shl i64 %39, 3
  %41 = and i64 %40, 34359738360
  %42 = add nuw nsw i64 %41, 8
  %43 = icmp sgt i64 %indvars.iv129, -1
  br i1 %43, label %.lr.ph40.preheader, label %._crit_edge41

.lr.ph40.preheader:                               ; preds = %36
  %wide.trip.count118 = zext i32 %indvars.iv116 to i64
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40, %.lr.ph40.preheader
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %.lr.ph40 ], [ 0, %.lr.ph40.preheader ]
  %44 = sub nsw i64 0, %indvars.iv112
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %9
  %49 = fadd double %48, 1.000000e+00
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv112
  store double %49, double* %50, align 8
  %exitcond119 = icmp eq i64 %indvars.iv112, %wide.trip.count118
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br i1 %exitcond119, label %._crit_edge41.loopexit, label %.lr.ph40

._crit_edge41.loopexit:                           ; preds = %.lr.ph40
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %36
  %indvars.iv.next130 = add i64 %indvars.iv129, 1
  %51 = icmp slt i64 %indvars.iv.next130, %11
  br i1 %51, label %.._crit_edge46_crit_edge, label %._crit_edge46

.._crit_edge46_crit_edge:                         ; preds = %._crit_edge41
  %52 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 %42, i32 8, i1 false)
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge41, %.._crit_edge46_crit_edge
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %53, align 8
  br i1 %51, label %._crit_edge46._crit_edge, label %._crit_edge51

._crit_edge46._crit_edge:                         ; preds = %._crit_edge46
  %indvars.iv.next117 = add i32 %indvars.iv116, 1
  br label %36

._crit_edge51:                                    ; preds = %._crit_edge46
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge.._crit_edge70_crit_edge, %._crit_edge.thread, %._crit_edge51
  %54 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %55 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %54, i8** %55, align 8
  %56 = bitcast i8* %54 to [2000 x [2000 x double]]*
  br i1 %10, label %.lr.ph33, label %._crit_edge74.thread

._crit_edge74.thread:                             ; preds = %._crit_edge70
  br label %._crit_edge76

.lr.ph33:                                         ; preds = %._crit_edge70
  %57 = sext i32 %0 to i64
  br i1 true, label %.lr.ph33..lr.ph33.split.us_crit_edge, label %.lr.ph33.split.._crit_edge34_crit_edge

.lr.ph33..lr.ph33.split.us_crit_edge:             ; preds = %.lr.ph33
  %58 = add i32 %0, -1
  %59 = zext i32 %58 to i64
  %60 = shl nuw nsw i64 %59, 3
  %61 = add nuw nsw i64 %60, 8
  %62 = add nsw i64 %57, -1
  %xtraiter198 = and i64 %57, 3
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod199, label %._crit_edge29.us.prol.loopexit, label %._crit_edge29.us.prol.preheader

._crit_edge29.us.prol.preheader:                  ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge
  br label %._crit_edge29.us.prol

._crit_edge29.us.prol:                            ; preds = %._crit_edge29.us.prol, %._crit_edge29.us.prol.preheader
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %prol.iter200 = phi i64 [ %prol.iter200.sub, %._crit_edge29.us.prol ], [ %xtraiter198, %._crit_edge29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.prol, i64 0
  %scevgep108.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.prol, i8 0, i64 %61, i32 8, i1 false)
  %indvars.iv.next110.prol = add i64 %indvars.iv109.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter200.sub = add i64 %prol.iter200, -1
  %prol.iter200.cmp = icmp eq i64 %prol.iter200.sub, 0
  br i1 %prol.iter200.cmp, label %._crit_edge29.us.prol.loopexit.unr-lcssa, label %._crit_edge29.us.prol, !llvm.loop !1

._crit_edge29.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge29.us.prol
  br label %._crit_edge29.us.prol.loopexit

._crit_edge29.us.prol.loopexit:                   ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge, %._crit_edge29.us.prol.loopexit.unr-lcssa
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvars.iv.next110.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvar.next.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %63 = icmp ult i64 %62, 3
  br i1 %63, label %._crit_edge29.us.._crit_edge34_crit_edge, label %.lr.ph33..lr.ph33.split.us_crit_edge.new

.lr.ph33..lr.ph33.split.us_crit_edge.new:         ; preds = %._crit_edge29.us.prol.loopexit
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33..lr.ph33.split.us_crit_edge.new
  %indvars.iv109 = phi i64 [ %indvars.iv109.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvars.iv.next110.3, %._crit_edge29.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 %61, i32 8, i1 false)
  %indvars.iv.next110.3 = add i64 %indvars.iv109, 4
  %64 = icmp slt i64 %indvars.iv.next110.3, %57
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %64, label %._crit_edge29.us, label %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa

._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa: ; preds = %._crit_edge29.us
  br label %._crit_edge29.us.._crit_edge34_crit_edge

._crit_edge29.us.._crit_edge34_crit_edge:         ; preds = %._crit_edge29.us.prol.loopexit, %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa
  %.pr139.pre = load i32, i32* %6, align 4
  br label %._crit_edge74

.lr.ph33.split.._crit_edge34_crit_edge:           ; preds = %.lr.ph33
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge29.us.._crit_edge34_crit_edge, %.lr.ph33.split.._crit_edge34_crit_edge
  %65 = phi i32 [ %.pr139.pre, %._crit_edge29.us.._crit_edge34_crit_edge ], [ %0, %.lr.ph33.split.._crit_edge34_crit_edge ]
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %.lr.ph20, label %._crit_edge76.thread

._crit_edge76.thread:                             ; preds = %._crit_edge74
  %.pre = load i8*, i8** %55, align 8
  br label %._crit_edge78

.lr.ph20:                                         ; preds = %._crit_edge74
  %67 = sext i32 %65 to i64
  %68 = load [2000 x double]*, [2000 x double]** %7, align 8
  %69 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %70 = bitcast [2000 x [2000 x double]]* %69 to i8*
  br i1 true, label %.lr.ph20.split.us, label %.lr.ph20.split.._crit_edge21_crit_edge

.lr.ph20.split.us:                                ; preds = %.lr.ph20
  %71 = add i32 %65, -1
  %wide.trip.count99 = zext i32 %71 to i64
  %72 = add nuw nsw i64 %wide.trip.count99, 1
  %73 = add nuw nsw i64 %wide.trip.count99, 1
  %min.iters.check = icmp ult i64 %72, 4
  %n.vec = and i64 %72, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %72, %n.vec
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us, %.lr.ph20.split.us
  %indvar145 = phi i64 [ %74, %._crit_edge14.us ], [ 0, %.lr.ph20.split.us ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge14.us ], [ 0, %.lr.ph20.split.us ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %68, i64 0, i64 %indvar145
  %74 = add i64 %indvar145, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %68, i64 %wide.trip.count99, i64 %74
  br i1 true, label %.lr.ph9.us.us.preheader, label %.lr.ph13.us.._crit_edge14.us_crit_edge

.lr.ph13.us.._crit_edge14.us_crit_edge:           ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

.lr.ph9.us.us.preheader:                          ; preds = %.lr.ph13.us
  br label %.lr.ph9.us.us

._crit_edge14.us:                                 ; preds = %.lr.ph13.us.._crit_edge14.us_crit_edge, %._crit_edge10.us.us.._crit_edge14.us_crit_edge
  %indvars.iv.next104 = add i64 %indvars.iv103, 1
  %75 = icmp slt i64 %indvars.iv.next104, %67
  br i1 %75, label %.lr.ph13.us, label %._crit_edge14.us.._crit_edge21_crit_edge

._crit_edge14.us.._crit_edge21_crit_edge:         ; preds = %._crit_edge14.us
  br label %._crit_edge21

.lr.ph9.us.us:                                    ; preds = %.lr.ph9.us.us.preheader, %._crit_edge10.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge10.us.us ], [ 0, %.lr.ph9.us.us.preheader ]
  %scevgep141 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 0
  %scevgep143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 %72
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv101, i64 %indvars.iv103
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.us.us
  %indvars.iv97.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9.us.us ], [ %n.vec, %middle.block ]
  %77 = sub nsw i64 %73, %indvars.iv97.ph
  %xtraiter196 = and i64 %77, 1
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %78 = load double, double* %76, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv97.ph, i64 %indvars.iv103
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 %indvars.iv97.ph
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %82, align 8
  %indvars.iv.next98.prol = or i64 %indvars.iv97.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv97.unr.ph = phi i64 [ %indvars.iv.next98.prol, %scalar.ph.prol ], [ %indvars.iv97.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %85 = icmp eq i64 %wide.trip.count99, %indvars.iv97.ph
  br i1 %85, label %._crit_edge10.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph9.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep141, %scevgep149
  %bound1 = icmp ult double* %scevgep147, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bound0152 = icmp ult double* %scevgep141, %76
  %bound1153 = icmp ult double* %76, %scevgep143
  %found.conflict154 = and i1 %bound0152, %bound1153
  %conflict.rdx = or i1 %found.conflict, %found.conflict154
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %86 = or i64 %index, 1
  %87 = or i64 %index, 2
  %88 = or i64 %index, 3
  %89 = load double, double* %76, align 8, !alias.scope !3
  %90 = insertelement <2 x double> undef, double %89, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> undef, <2 x i32> zeroinitializer
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %index, i64 %indvars.iv103
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %86, i64 %indvars.iv103
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %87, i64 %indvars.iv103
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %88, i64 %indvars.iv103
  %96 = load double, double* %92, align 8, !alias.scope !6
  %97 = load double, double* %93, align 8, !alias.scope !6
  %98 = load double, double* %94, align 8, !alias.scope !6
  %99 = load double, double* %95, align 8, !alias.scope !6
  %100 = insertelement <2 x double> undef, double %96, i32 0
  %101 = insertelement <2 x double> %100, double %97, i32 1
  %102 = insertelement <2 x double> undef, double %98, i32 0
  %103 = insertelement <2 x double> %102, double %99, i32 1
  %104 = fmul <2 x double> %91, %101
  %105 = fmul <2 x double> %91, %103
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 %index
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !8, !noalias !10
  %110 = fadd <2 x double> %104, %wide.load
  %111 = fadd <2 x double> %105, %wide.load156
  store <2 x double> %110, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %111, <2 x double>* %109, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %112 = icmp eq i64 %index.next, %n.vec
  br i1 %112, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10.us.us, label %scalar.ph.preheader

._crit_edge10.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge10.us.us.loopexit

._crit_edge10.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge10.us.us.loopexit.unr-lcssa
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %middle.block
  %indvars.iv.next102 = add nuw i64 %indvars.iv101, 1
  %113 = icmp slt i64 %indvars.iv.next102, %67
  br i1 %113, label %.lr.ph9.us.us, label %._crit_edge10.us.us.._crit_edge14.us_crit_edge

._crit_edge10.us.us.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge10.us.us
  br label %._crit_edge14.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next98.1, %scalar.ph ]
  %114 = load double, double* %76, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv97, i64 %indvars.iv103
  %116 = load double, double* %115, align 8
  %117 = fmul double %114, %116
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  store double %120, double* %118, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %121 = load double, double* %76, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv.next98, i64 %indvars.iv103
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  store double %127, double* %125, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %._crit_edge10.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.lr.ph20.split.._crit_edge21_crit_edge:           ; preds = %.lr.ph20
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.lr.ph20.split.._crit_edge21_crit_edge, %._crit_edge14.us.._crit_edge21_crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge74.thread, %._crit_edge21
  %128 = phi i8* [ %54, %._crit_edge74.thread ], [ %70, %._crit_edge21 ]
  %129 = phi [2000 x double]* [ %1, %._crit_edge74.thread ], [ %68, %._crit_edge21 ]
  %130 = phi [2000 x [2000 x double]]* [ %56, %._crit_edge74.thread ], [ %69, %._crit_edge21 ]
  %131 = phi i32 [ %0, %._crit_edge74.thread ], [ %65, %._crit_edge21 ]
  %132 = icmp sgt i32 %131, 0
  br i1 %132, label %.lr.ph2, label %._crit_edge78

.lr.ph2:                                          ; preds = %._crit_edge76
  %133 = sext i32 %131 to i64
  br i1 true, label %.lr.ph2..lr.ph2.split.us_crit_edge, label %.lr.ph2.split.._crit_edge3_crit_edge

.lr.ph2..lr.ph2.split.us_crit_edge:               ; preds = %.lr.ph2
  %134 = add i32 %131, -1
  %wide.trip.count93 = zext i32 %134 to i64
  %135 = add nuw nsw i64 %wide.trip.count93, 1
  %136 = and i64 %135, 8589934588
  %137 = add nsw i64 %136, -4
  %138 = lshr exact i64 %137, 2
  %139 = add nuw nsw i64 %wide.trip.count93, 1
  %min.iters.check160 = icmp ult i64 %135, 4
  %n.vec163 = and i64 %135, 8589934588
  %cmp.zero164 = icmp eq i64 %n.vec163, 0
  %140 = and i64 %138, 1
  %lcmp.mod = icmp eq i64 %140, 0
  %141 = icmp eq i64 %138, 0
  %cmp.n185 = icmp eq i64 %135, %n.vec163
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2..lr.ph2.split.us_crit_edge
  %indvar166 = phi i64 [ %indvar.next167, %._crit_edge.us ], [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ]
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvar166, i64 0
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvar166, i64 %135
  %scevgep172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvar166, i64 0
  %scevgep174 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvar166, i64 %135
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
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 0
  %143 = bitcast double* %142 to <2 x i64>*
  %wide.load190.prol = load <2 x i64>, <2 x i64>* %143, align 8, !alias.scope !15
  %144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 2
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load191.prol = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !15
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 0
  %147 = bitcast double* %146 to <2 x i64>*
  store <2 x i64> %wide.load190.prol, <2 x i64>* %147, align 8, !alias.scope !18, !noalias !15
  %148 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 2
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load191.prol, <2 x i64>* %149, align 8, !alias.scope !18, !noalias !15
  br label %vector.body157.prol.loopexit.unr-lcssa

vector.body157.prol.loopexit.unr-lcssa:           ; preds = %vector.body157.preheader, %vector.body157.prol
  %index182.unr.ph = phi i64 [ 4, %vector.body157.prol ], [ 0, %vector.body157.preheader ]
  br label %vector.body157.prol.loopexit

vector.body157.prol.loopexit:                     ; preds = %vector.body157.prol.loopexit.unr-lcssa
  br i1 %141, label %middle.block158, label %vector.body157.preheader.new

vector.body157.preheader.new:                     ; preds = %vector.body157.prol.loopexit
  br label %vector.body157

vector.body157:                                   ; preds = %vector.body157, %vector.body157.preheader.new
  %index182 = phi i64 [ %index182.unr.ph, %vector.body157.preheader.new ], [ %index.next183.1, %vector.body157 ]
  %150 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %index182
  %151 = bitcast double* %150 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %151, align 8, !alias.scope !15
  %152 = getelementptr double, double* %150, i64 2
  %153 = bitcast double* %152 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !15
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %index182
  %155 = bitcast double* %154 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %155, align 8, !alias.scope !18, !noalias !15
  %156 = getelementptr double, double* %154, i64 2
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %157, align 8, !alias.scope !18, !noalias !15
  %index.next183 = add i64 %index182, 4
  %158 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %index.next183
  %159 = bitcast double* %158 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %159, align 8, !alias.scope !15
  %160 = getelementptr double, double* %158, i64 2
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !15
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %index.next183
  %163 = bitcast double* %162 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %163, align 8, !alias.scope !18, !noalias !15
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %165, align 8, !alias.scope !18, !noalias !15
  %index.next183.1 = add i64 %index182, 8
  %166 = icmp eq i64 %index.next183.1, %n.vec163
  br i1 %166, label %middle.block158.unr-lcssa, label %vector.body157, !llvm.loop !20

middle.block158.unr-lcssa:                        ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %vector.body157.prol.loopexit, %middle.block158.unr-lcssa
  br i1 %cmp.n185, label %._crit_edge.us, label %scalar.ph159.preheader

scalar.ph159.preheader:                           ; preds = %middle.block158, %vector.memcheck180, %min.iters.checked161, %.lr.ph2.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck180 ], [ 0, %min.iters.checked161 ], [ 0, %.lr.ph2.split.us ], [ %n.vec163, %middle.block158 ]
  %167 = sub nsw i64 %139, %indvars.iv.ph
  %168 = sub nsw i64 %wide.trip.count93, %indvars.iv.ph
  %xtraiter194 = and i64 %167, 3
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %scalar.ph159.prol.loopexit, label %scalar.ph159.prol.preheader

scalar.ph159.prol.preheader:                      ; preds = %scalar.ph159.preheader
  br label %scalar.ph159.prol

scalar.ph159.prol:                                ; preds = %scalar.ph159.prol, %scalar.ph159.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph159.prol ], [ %indvars.iv.ph, %scalar.ph159.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph159.prol ], [ %xtraiter194, %scalar.ph159.prol.preheader ]
  %169 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %170 = bitcast double* %169 to i64*
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %indvars.iv.prol
  %173 = bitcast double* %172 to i64*
  store i64 %171, i64* %173, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph159.prol.loopexit.unr-lcssa, label %scalar.ph159.prol, !llvm.loop !21

scalar.ph159.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph159.prol
  br label %scalar.ph159.prol.loopexit

scalar.ph159.prol.loopexit:                       ; preds = %scalar.ph159.preheader, %scalar.ph159.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph159.preheader ], [ %indvars.iv.next.prol, %scalar.ph159.prol.loopexit.unr-lcssa ]
  %174 = icmp ult i64 %168, 3
  br i1 %174, label %._crit_edge.us.loopexit, label %scalar.ph159.preheader.new

scalar.ph159.preheader.new:                       ; preds = %scalar.ph159.prol.loopexit
  br label %scalar.ph159

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph159.preheader.new ], [ %indvars.iv.next.3, %scalar.ph159 ]
  %175 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %176 = bitcast double* %175 to i64*
  %177 = load i64, i64* %176, align 8
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %indvars.iv
  %179 = bitcast double* %178 to i64*
  store i64 %177, i64* %179, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %180 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %181 = bitcast double* %180 to i64*
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %indvars.iv.next
  %184 = bitcast double* %183 to i64*
  store i64 %182, i64* %184, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %190 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %191 = bitcast double* %190 to i64*
  %192 = load i64, i64* %191, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %194 = bitcast double* %193 to i64*
  store i64 %192, i64* %194, align 8
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count93
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph159, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph159
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph159.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block158
  %indvars.iv.next96 = add i64 %indvars.iv95, 1
  %195 = icmp slt i64 %indvars.iv.next96, %133
  %indvar.next167 = add i64 %indvar166, 1
  br i1 %195, label %.lr.ph2.split.us, label %._crit_edge.us.._crit_edge3_crit_edge

._crit_edge.us.._crit_edge3_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge3

.lr.ph2.split.._crit_edge3_crit_edge:             ; preds = %.lr.ph2
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.lr.ph2.split.._crit_edge3_crit_edge, %._crit_edge.us.._crit_edge3_crit_edge
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge76, %._crit_edge76.thread, %._crit_edge3
  %196 = phi i8* [ %128, %._crit_edge76 ], [ %.pre, %._crit_edge76.thread ], [ %128, %._crit_edge3 ]
  tail call void @free(i8* %196) #5
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
  br label %10

; <label>:10:                                     ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge48 ], [ 0, %.lr.ph56 ]
  %indvars.iv129 = phi i32 [ %15, %._crit_edge48 ], [ -1, %.lr.ph56 ]
  %11 = add i64 %indvars.iv137, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = sub i64 %9, %indvars.iv137
  %14 = sub i64 %wide.trip.count120, %indvars.iv137
  %15 = add i32 %indvars.iv129, 1
  %16 = icmp sgt i64 %indvars.iv137, 0
  br i1 %16, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %10
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %._crit_edge27
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv110 = phi i32 [ %20, %._crit_edge27 ], [ -1, %.lr.ph32.preheader ]
  %18 = add i64 %indvars.iv114, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = add i32 %indvars.iv110, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %22 = load double, double* %21, align 8
  %23 = icmp sgt i64 %indvars.iv114, 0
  br i1 %23, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %24 = and i64 %18, 1
  %lcmp.mod159 = icmp eq i64 %24, 0
  br i1 %lcmp.mod159, label %.lr.ph26.prol.preheader, label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.preheader:                          ; preds = %.lr.ph26.preheader
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol.preheader
  %25 = load double, double* %17, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %22, %28
  br label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph26.preheader, %.lr.ph26.prol
  %.lcssa152.unr.ph = phi double [ %29, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr160.ph = phi double [ %29, %.lr.ph26.prol ], [ %22, %.lr.ph26.preheader ]
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %19, 0
  br i1 %30, label %._crit_edge27.loopexit, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %31 = phi double [ %.unr160.ph, %.lr.ph26.preheader.new ], [ %45, %.lr.ph26 ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %33 = bitcast double* %32 to <2 x double>*
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %35 = load double, double* %34, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %36 = load <2 x double>, <2 x double>* %33, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %38 = load double, double* %37, align 8
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %36, %40
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = fsub double %31, %42
  %45 = fsub double %44, %43
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %wide.trip.count112
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge27.loopexit.unr-lcssa, label %.lr.ph26

._crit_edge27.loopexit.unr-lcssa:                 ; preds = %.lr.ph26
  br label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26.prol.loopexit, %._crit_edge27.loopexit.unr-lcssa
  %.lcssa152 = phi double [ %.lcssa152.unr.ph, %.lr.ph26.prol.loopexit ], [ %45, %._crit_edge27.loopexit.unr-lcssa ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %22, %.lr.ph32 ], [ %.lcssa152, %._crit_edge27.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %47 = load double, double* %46, align 8
  %48 = fdiv double %.lcssa3038, %47
  store double %48, double* %21, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %49 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %49, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge27
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %10
  %50 = icmp slt i64 %indvars.iv137, %8
  br i1 %50, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge33
  br i1 %16, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter161 = and i64 %13, 7
  %lcmp.mod162 = icmp eq i64 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph47.split.prol ], [ %indvars.iv137, %.lr.ph47.split.prol.preheader ]
  %prol.iter163 = phi i64 [ %prol.iter163.sub, %.lr.ph47.split.prol ], [ %xtraiter161, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter163.sub = add i64 %prol.iter163, -1
  %prol.iter163.cmp = icmp eq i64 %prol.iter163.sub, 0
  br i1 %prol.iter163.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !23

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph47.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %14, 7
  br i1 %51, label %.lr.ph47.split.._crit_edge48_crit_edge, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %52 = and i64 %11, 1
  %lcmp.mod167 = icmp eq i64 %52, 0
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %54 = icmp eq i64 %12, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv137, %.lr.ph47.split.us.preheader ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %56 = load double, double* %55, align 8
  br i1 %lcmp.mod167, label %.prol.preheader164, label %.prol.loopexit165.unr-lcssa

.prol.preheader164:                               ; preds = %.lr.ph47.split.us
  br label %57

; <label>:57:                                     ; preds = %.prol.preheader164
  %58 = load double, double* %53, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fsub double %56, %61
  br label %.prol.loopexit165.unr-lcssa

.prol.loopexit165.unr-lcssa:                      ; preds = %.lr.ph47.split.us, %57
  %.lcssa153.unr.ph = phi double [ %62, %57 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %57 ], [ 0, %.lr.ph47.split.us ]
  %.unr168.ph = phi double [ %62, %57 ], [ %56, %.lr.ph47.split.us ]
  br label %.prol.loopexit165

.prol.loopexit165:                                ; preds = %.prol.loopexit165.unr-lcssa
  br i1 %54, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit165
  br label %63

; <label>:63:                                     ; preds = %63, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %63 ]
  %64 = phi double [ %.unr168.ph, %.lr.ph47.split.us.new ], [ %78, %63 ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %66 = bitcast double* %65 to <2 x double>*
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %68 = load double, double* %67, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %69 = load <2 x double>, <2 x double>* %66, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %71 = load double, double* %70, align 8
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %71, i32 1
  %74 = fmul <2 x double> %69, %73
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fsub double %64, %75
  %78 = fsub double %77, %76
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge41.us.unr-lcssa, label %63

._crit_edge41.us.unr-lcssa:                       ; preds = %63
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit165, %._crit_edge41.us.unr-lcssa
  %.lcssa153 = phi double [ %.lcssa153.unr.ph, %.prol.loopexit165 ], [ %78, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa153, double* %55, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %79 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %79, label %.lr.ph47.split.us, label %._crit_edge48.loopexit

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
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %80 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %80, label %10, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge48
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %5, %._crit_edge57
  br i1 %6, label %.lr.ph18, label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge69
  br label %._crit_edge76

.lr.ph18:                                         ; preds = %._crit_edge69
  %81 = sext i32 %0 to i64
  br label %82

; <label>:82:                                     ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %83 = add i64 %indvars.iv102, 4294967295
  %84 = and i64 %83, 4294967295
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %86 = load double, double* %85, align 8
  %87 = icmp sgt i64 %indvars.iv102, 0
  br i1 %87, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %82
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
  %prol.iter156.sub = add i64 %prol.iter156, -1
  %prol.iter156.cmp = icmp eq i64 %prol.iter156.sub, 0
  br i1 %prol.iter156.cmp, label %.lr.ph12.prol.loopexit.unr-lcssa, label %.lr.ph12.prol, !llvm.loop !24

.lr.ph12.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol.loopexit.unr-lcssa
  %.lcssa151.unr = phi double [ undef, %.lr.ph12.preheader ], [ %94, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %indvars.iv.next93.prol, %.lr.ph12.prol.loopexit.unr-lcssa ]
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

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %82
  %.lcssa1624 = phi double [ %86, %82 ], [ %.lcssa151, %._crit_edge13.loopexit ]
  %119 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  store double %.lcssa1624, double* %119, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %120 = icmp slt i64 %indvars.iv.next103, %81
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %120, label %82, label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge13
  br i1 true, label %.lr.ph4, label %._crit_edge73.._crit_edge76_crit_edge

._crit_edge73.._crit_edge76_crit_edge:            ; preds = %._crit_edge73
  br label %._crit_edge76

.lr.ph4:                                          ; preds = %._crit_edge73
  %121 = add i32 %0, -1
  %122 = sext i32 %121 to i64
  %123 = add nsw i64 %122, 1
  br label %124

; <label>:124:                                    ; preds = %._crit_edge, %.lr.ph4
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph4 ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge ], [ %122, %.lr.ph4 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge ], [ %0, %.lr.ph4 ]
  %125 = sub i32 %0, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 %122, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv90, 1
  %131 = icmp slt i64 %130, %81
  br i1 %131, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %124
  %132 = sub nsw i64 %123, %126
  %133 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %134

; <label>:134:                                    ; preds = %134, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %134 ], [ %133, %.prol.preheader ]
  %135 = phi double [ %141, %134 ], [ %129, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %134 ], [ %xtraiter, %.prol.preheader ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv88.prol
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fsub double %135, %140
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %134, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %134
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %indvars.iv88.unr = phi i64 [ %133, %.lr.ph ], [ %indvars.iv.next89.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %129, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %142 = icmp ult i64 %127, 3
  br i1 %142, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %143

; <label>:143:                                    ; preds = %143, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %143 ]
  %144 = phi double [ %.unr, %.lr.ph.new ], [ %166, %143 ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88
  %146 = bitcast double* %145 to <2 x double>*
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %146, align 8
  %150 = load <2 x double>, <2 x double>* %148, align 8
  %151 = fmul <2 x double> %149, %150
  %152 = extractelement <2 x double> %151, i32 0
  %153 = extractelement <2 x double> %151, i32 1
  %154 = fsub double %144, %152
  %155 = fsub double %154, %153
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %157 = bitcast double* %156 to <2 x double>*
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next89.1
  %159 = bitcast double* %158 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %160 = load <2 x double>, <2 x double>* %157, align 8
  %161 = load <2 x double>, <2 x double>* %159, align 8
  %162 = fmul <2 x double> %160, %161
  %163 = extractelement <2 x double> %162, i32 0
  %164 = extractelement <2 x double> %162, i32 1
  %165 = fsub double %155, %163
  %166 = fsub double %165, %164
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, %122
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %143

._crit_edge.loopexit.unr-lcssa:                   ; preds = %143
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %166, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %124
  %.lcssa210 = phi double [ %129, %124 ], [ %.lcssa, %._crit_edge.loopexit ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv90
  %168 = load double, double* %167, align 8
  %169 = fdiv double %.lcssa210, %168
  %170 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double %169, double* %170, align 8
  %indvars.iv.next91 = add i64 %indvars.iv90, -1
  %171 = icmp sgt i64 %indvars.iv90, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %171, label %124, label %._crit_edge5

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
