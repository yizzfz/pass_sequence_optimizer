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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
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
  br i1 %10, label %.lr.ph68, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %5
  br label %._crit_edge81

.lr.ph68:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter212 = and i64 %11, 1
  %lcmp.mod213 = icmp eq i64 %xtraiter212, 0
  br i1 %lcmp.mod213, label %._crit_edge80.prol.loopexit, label %._crit_edge80.prol.preheader

._crit_edge80.prol.preheader:                     ; preds = %.lr.ph68
  br label %._crit_edge80.prol

._crit_edge80.prol:                               ; preds = %._crit_edge80.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge80.prol.loopexit

._crit_edge80.prol.loopexit:                      ; preds = %.lr.ph68, %._crit_edge80.prol
  %indvars.iv142.unr = phi i64 [ 0, %.lr.ph68 ], [ 1, %._crit_edge80.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge, label %.lr.ph68.new

.lr.ph68.new:                                     ; preds = %._crit_edge80.prol.loopexit
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80, %.lr.ph68.new
  %indvars.iv142 = phi i64 [ %indvars.iv142.unr, %.lr.ph68.new ], [ %indvars.iv.next143.1, %._crit_edge80 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv142
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  %19 = bitcast double* %18 to <2 x double>*
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %20 = trunc i64 %indvars.iv.next143 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv142
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %23 = trunc i64 %indvars.iv.next143.1 to i32
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
  %33 = icmp slt i64 %indvars.iv.next143.1, %11
  br i1 %33, label %._crit_edge80, label %._crit_edge.unr-lcssa

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge80
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge80.prol.loopexit, %._crit_edge.unr-lcssa
  br i1 true, label %.lr.ph61, label %._crit_edge.._crit_edge81_crit_edge

._crit_edge.._crit_edge81_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge81

.lr.ph61:                                         ; preds = %._crit_edge
  %34 = add i32 %0, -2
  %35 = zext i32 %34 to i64
  br label %36

; <label>:36:                                     ; preds = %._crit_edge57._crit_edge, %.lr.ph61
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge57._crit_edge ], [ 0, %.lr.ph61 ]
  %indvar135 = phi i64 [ %37, %._crit_edge57._crit_edge ], [ 0, %.lr.ph61 ]
  %indvars.iv127 = phi i32 [ %indvars.iv.next128, %._crit_edge57._crit_edge ], [ 0, %.lr.ph61 ]
  %37 = add i64 %indvar135, 1
  %sext = shl i64 %37, 32
  %38 = ashr exact i64 %sext, 32
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar135, i64 %38
  %39 = sub i64 %35, %indvar135
  %40 = shl i64 %39, 3
  %41 = and i64 %40, 34359738360
  %42 = add nuw nsw i64 %41, 8
  %43 = icmp slt i64 %indvars.iv140, 0
  br i1 %43, label %._crit_edge51, label %.lr.ph50.preheader

.lr.ph50.preheader:                               ; preds = %36
  %wide.trip.count129 = zext i32 %indvars.iv127 to i64
  br label %.lr.ph50

.lr.ph50:                                         ; preds = %.lr.ph50, %.lr.ph50.preheader
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %.lr.ph50 ], [ 0, %.lr.ph50.preheader ]
  %44 = sub nsw i64 0, %indvars.iv123
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %9
  %49 = fadd double %48, 1.000000e+00
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv123
  store double %49, double* %50, align 8
  %exitcond130 = icmp eq i64 %indvars.iv123, %wide.trip.count129
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  br i1 %exitcond130, label %._crit_edge51.loopexit, label %.lr.ph50

._crit_edge51.loopexit:                           ; preds = %.lr.ph50
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %36
  %indvars.iv.next141 = add i64 %indvars.iv140, 1
  %51 = icmp slt i64 %indvars.iv.next141, %11
  br i1 %51, label %.._crit_edge57_crit_edge, label %._crit_edge57

.._crit_edge57_crit_edge:                         ; preds = %._crit_edge51
  %52 = bitcast double* %scevgep138 to i8*
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 %42, i32 8, i1 false)
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge51, %.._crit_edge57_crit_edge
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv140
  store double 1.000000e+00, double* %53, align 8
  br i1 %51, label %._crit_edge57._crit_edge, label %._crit_edge62

._crit_edge57._crit_edge:                         ; preds = %._crit_edge57
  %indvars.iv.next128 = add i32 %indvars.iv127, 1
  br label %36

._crit_edge62:                                    ; preds = %._crit_edge57
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge.._crit_edge81_crit_edge, %._crit_edge.thread, %._crit_edge62
  %54 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %55 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %54, i8** %55, align 8
  %56 = bitcast i8* %54 to [2000 x [2000 x double]]*
  br i1 %10, label %.lr.ph43, label %._crit_edge85.thread

._crit_edge85.thread:                             ; preds = %._crit_edge81
  br label %._crit_edge87

.lr.ph43:                                         ; preds = %._crit_edge81
  %57 = sext i32 %0 to i64
  br i1 true, label %.lr.ph43..lr.ph43.split.us_crit_edge, label %.lr.ph43.split.._crit_edge44_crit_edge

.lr.ph43..lr.ph43.split.us_crit_edge:             ; preds = %.lr.ph43
  %58 = add i32 %0, -1
  %59 = zext i32 %58 to i64
  %60 = shl nuw nsw i64 %59, 3
  %61 = add nuw nsw i64 %60, 8
  %62 = add nsw i64 %57, -1
  %xtraiter209 = and i64 %57, 3
  %lcmp.mod210 = icmp eq i64 %xtraiter209, 0
  br i1 %lcmp.mod210, label %._crit_edge39.us.prol.loopexit, label %._crit_edge39.us.prol.preheader

._crit_edge39.us.prol.preheader:                  ; preds = %.lr.ph43..lr.ph43.split.us_crit_edge
  br label %._crit_edge39.us.prol

._crit_edge39.us.prol:                            ; preds = %._crit_edge39.us.prol, %._crit_edge39.us.prol.preheader
  %indvars.iv120.prol = phi i64 [ %indvars.iv.next121.prol, %._crit_edge39.us.prol ], [ 0, %._crit_edge39.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge39.us.prol ], [ 0, %._crit_edge39.us.prol.preheader ]
  %prol.iter211 = phi i64 [ %prol.iter211.sub, %._crit_edge39.us.prol ], [ %xtraiter209, %._crit_edge39.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.prol, i64 0
  %scevgep119.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep119.prol, i8 0, i64 %61, i32 8, i1 false)
  %indvars.iv.next121.prol = add i64 %indvars.iv120.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter211.sub = add i64 %prol.iter211, -1
  %prol.iter211.cmp = icmp eq i64 %prol.iter211.sub, 0
  br i1 %prol.iter211.cmp, label %._crit_edge39.us.prol.loopexit.unr-lcssa, label %._crit_edge39.us.prol, !llvm.loop !1

._crit_edge39.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge39.us.prol
  br label %._crit_edge39.us.prol.loopexit

._crit_edge39.us.prol.loopexit:                   ; preds = %.lr.ph43..lr.ph43.split.us_crit_edge, %._crit_edge39.us.prol.loopexit.unr-lcssa
  %indvars.iv120.unr = phi i64 [ 0, %.lr.ph43..lr.ph43.split.us_crit_edge ], [ %indvars.iv.next121.prol, %._crit_edge39.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph43..lr.ph43.split.us_crit_edge ], [ %indvar.next.prol, %._crit_edge39.us.prol.loopexit.unr-lcssa ]
  %63 = icmp ult i64 %62, 3
  br i1 %63, label %._crit_edge39.us.._crit_edge44_crit_edge, label %.lr.ph43..lr.ph43.split.us_crit_edge.new

.lr.ph43..lr.ph43.split.us_crit_edge.new:         ; preds = %._crit_edge39.us.prol.loopexit
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %._crit_edge39.us, %.lr.ph43..lr.ph43.split.us_crit_edge.new
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr, %.lr.ph43..lr.ph43.split.us_crit_edge.new ], [ %indvars.iv.next121.3, %._crit_edge39.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph43..lr.ph43.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge39.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar, i64 0
  %scevgep119 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep119, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next, i64 0
  %scevgep119.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep119.1, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next.1, i64 0
  %scevgep119.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep119.2, i8 0, i64 %61, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvar.next.2, i64 0
  %scevgep119.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep119.3, i8 0, i64 %61, i32 8, i1 false)
  %indvars.iv.next121.3 = add i64 %indvars.iv120, 4
  %64 = icmp slt i64 %indvars.iv.next121.3, %57
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %64, label %._crit_edge39.us, label %._crit_edge39.us.._crit_edge44_crit_edge.unr-lcssa

._crit_edge39.us.._crit_edge44_crit_edge.unr-lcssa: ; preds = %._crit_edge39.us
  br label %._crit_edge39.us.._crit_edge44_crit_edge

._crit_edge39.us.._crit_edge44_crit_edge:         ; preds = %._crit_edge39.us.prol.loopexit, %._crit_edge39.us.._crit_edge44_crit_edge.unr-lcssa
  %.pr150.pre = load i32, i32* %6, align 4
  br label %._crit_edge85

.lr.ph43.split.._crit_edge44_crit_edge:           ; preds = %.lr.ph43
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge39.us.._crit_edge44_crit_edge, %.lr.ph43.split.._crit_edge44_crit_edge
  %65 = phi i32 [ %.pr150.pre, %._crit_edge39.us.._crit_edge44_crit_edge ], [ undef, %.lr.ph43.split.._crit_edge44_crit_edge ]
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %.lr.ph30, label %._crit_edge87.thread

._crit_edge87.thread:                             ; preds = %._crit_edge85
  %.pre = load i8*, i8** %55, align 8
  br label %._crit_edge89

.lr.ph30:                                         ; preds = %._crit_edge85
  %67 = sext i32 %65 to i64
  %68 = load [2000 x double]*, [2000 x double]** %7, align 8
  %69 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %70 = bitcast [2000 x [2000 x double]]* %69 to i8*
  br i1 true, label %.lr.ph30..lr.ph30.split.us_crit_edge, label %.lr.ph30.split.._crit_edge31_crit_edge

.lr.ph30..lr.ph30.split.us_crit_edge:             ; preds = %.lr.ph30
  %71 = add i32 %65, -1
  %wide.trip.count110 = zext i32 %71 to i64
  %72 = add nuw nsw i64 %wide.trip.count110, 1
  %73 = add nuw nsw i64 %wide.trip.count110, 1
  %min.iters.check = icmp ult i64 %72, 4
  %n.vec = and i64 %72, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %72, %n.vec
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge24.us, %.lr.ph30..lr.ph30.split.us_crit_edge
  %indvar156 = phi i64 [ %74, %._crit_edge24.us ], [ 0, %.lr.ph30..lr.ph30.split.us_crit_edge ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge24.us ], [ 0, %.lr.ph30..lr.ph30.split.us_crit_edge ]
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %68, i64 0, i64 %indvar156
  %74 = add i64 %indvar156, 1
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %68, i64 %wide.trip.count110, i64 %74
  br i1 true, label %.lr.ph19.us.us.preheader, label %.lr.ph30.split.us.._crit_edge24.us_crit_edge

.lr.ph30.split.us.._crit_edge24.us_crit_edge:     ; preds = %.lr.ph30.split.us
  br label %._crit_edge24.us

.lr.ph19.us.us.preheader:                         ; preds = %.lr.ph30.split.us
  br label %.lr.ph19.us.us

._crit_edge24.us:                                 ; preds = %.lr.ph30.split.us.._crit_edge24.us_crit_edge, %._crit_edge20.us.us.._crit_edge24.us_crit_edge
  %indvars.iv.next115 = add i64 %indvars.iv114, 1
  %75 = icmp slt i64 %indvars.iv.next115, %67
  br i1 %75, label %.lr.ph30.split.us, label %._crit_edge24.us.._crit_edge31_crit_edge

._crit_edge24.us.._crit_edge31_crit_edge:         ; preds = %._crit_edge24.us
  br label %._crit_edge31

.lr.ph19.us.us:                                   ; preds = %.lr.ph19.us.us.preheader, %._crit_edge20.us.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge20.us.us ], [ 0, %.lr.ph19.us.us.preheader ]
  %scevgep152 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 0
  %scevgep154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 %72
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv112, i64 %indvars.iv114
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph19.us.us
  %indvars.iv108.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph19.us.us ], [ %n.vec, %middle.block ]
  %77 = sub nsw i64 %73, %indvars.iv108.ph
  %xtraiter207 = and i64 %77, 1
  %lcmp.mod208 = icmp eq i64 %xtraiter207, 0
  br i1 %lcmp.mod208, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %78 = load double, double* %76, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv108.ph, i64 %indvars.iv114
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 %indvars.iv108.ph
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %82, align 8
  %indvars.iv.next109.prol = or i64 %indvars.iv108.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv108.unr.ph = phi i64 [ %indvars.iv.next109.prol, %scalar.ph.prol ], [ %indvars.iv108.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %85 = icmp eq i64 %wide.trip.count110, %indvars.iv108.ph
  br i1 %85, label %._crit_edge20.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %.lr.ph19.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep152, %scevgep160
  %bound1 = icmp ult double* %scevgep158, %scevgep154
  %found.conflict = and i1 %bound0, %bound1
  %bound0163 = icmp ult double* %scevgep152, %76
  %bound1164 = icmp ult double* %76, %scevgep154
  %found.conflict165 = and i1 %bound0163, %bound1164
  %conflict.rdx = or i1 %found.conflict, %found.conflict165
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
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %index, i64 %indvars.iv114
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %86, i64 %indvars.iv114
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %87, i64 %indvars.iv114
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %88, i64 %indvars.iv114
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
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 %index
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !8, !noalias !10
  %110 = fadd <2 x double> %104, %wide.load
  %111 = fadd <2 x double> %105, %wide.load167
  store <2 x double> %110, <2 x double>* %107, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %111, <2 x double>* %109, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %112 = icmp eq i64 %index.next, %n.vec
  br i1 %112, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge20.us.us, label %scalar.ph.preheader

._crit_edge20.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge20.us.us.loopexit

._crit_edge20.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge20.us.us.loopexit.unr-lcssa
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %middle.block
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %113 = icmp slt i64 %indvars.iv.next113, %67
  br i1 %113, label %.lr.ph19.us.us, label %._crit_edge20.us.us.._crit_edge24.us_crit_edge

._crit_edge20.us.us.._crit_edge24.us_crit_edge:   ; preds = %._crit_edge20.us.us
  br label %._crit_edge24.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next109.1, %scalar.ph ]
  %114 = load double, double* %76, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv108, i64 %indvars.iv114
  %116 = load double, double* %115, align 8
  %117 = fmul double %114, %116
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 %indvars.iv108
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  store double %120, double* %118, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %121 = load double, double* %76, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 %indvars.iv.next109, i64 %indvars.iv114
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next109
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  store double %127, double* %125, align 8
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond111.1, label %._crit_edge20.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !14

.lr.ph30.split.._crit_edge31_crit_edge:           ; preds = %.lr.ph30
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %.lr.ph30.split.._crit_edge31_crit_edge, %._crit_edge24.us.._crit_edge31_crit_edge
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %._crit_edge85.thread, %._crit_edge31
  %128 = phi i8* [ %54, %._crit_edge85.thread ], [ %70, %._crit_edge31 ]
  %129 = phi [2000 x double]* [ %1, %._crit_edge85.thread ], [ %68, %._crit_edge31 ]
  %130 = phi [2000 x [2000 x double]]* [ %56, %._crit_edge85.thread ], [ %69, %._crit_edge31 ]
  %131 = phi i32 [ %0, %._crit_edge85.thread ], [ %65, %._crit_edge31 ]
  %132 = icmp sgt i32 %131, 0
  br i1 %132, label %.lr.ph12, label %._crit_edge89

.lr.ph12:                                         ; preds = %._crit_edge87
  %133 = sext i32 %131 to i64
  br i1 true, label %.lr.ph12..lr.ph12.split.us_crit_edge, label %.lr.ph12.split.._crit_edge13_crit_edge

.lr.ph12..lr.ph12.split.us_crit_edge:             ; preds = %.lr.ph12
  %134 = add i32 %131, -1
  %wide.trip.count104 = zext i32 %134 to i64
  %135 = add nuw nsw i64 %wide.trip.count104, 1
  %136 = and i64 %135, 8589934588
  %137 = add nsw i64 %136, -4
  %138 = lshr exact i64 %137, 2
  %139 = add nuw nsw i64 %wide.trip.count104, 1
  %min.iters.check171 = icmp ult i64 %135, 4
  %n.vec174 = and i64 %135, 8589934588
  %cmp.zero175 = icmp eq i64 %n.vec174, 0
  %140 = and i64 %138, 1
  %lcmp.mod = icmp eq i64 %140, 0
  %141 = icmp eq i64 %138, 0
  %cmp.n196 = icmp eq i64 %135, %n.vec174
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge.us, %.lr.ph12..lr.ph12.split.us_crit_edge
  %indvar177 = phi i64 [ %indvar.next178, %._crit_edge.us ], [ 0, %.lr.ph12..lr.ph12.split.us_crit_edge ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge.us ], [ 0, %.lr.ph12..lr.ph12.split.us_crit_edge ]
  %scevgep179 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvar177, i64 0
  %scevgep181 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvar177, i64 %135
  %scevgep183 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvar177, i64 0
  %scevgep185 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvar177, i64 %135
  br i1 %min.iters.check171, label %scalar.ph170.preheader, label %min.iters.checked172

min.iters.checked172:                             ; preds = %.lr.ph12.split.us
  br i1 %cmp.zero175, label %scalar.ph170.preheader, label %vector.memcheck191

vector.memcheck191:                               ; preds = %min.iters.checked172
  %bound0187 = icmp ult double* %scevgep179, %scevgep185
  %bound1188 = icmp ult double* %scevgep183, %scevgep181
  %memcheck.conflict190 = and i1 %bound0187, %bound1188
  br i1 %memcheck.conflict190, label %scalar.ph170.preheader, label %vector.body168.preheader

vector.body168.preheader:                         ; preds = %vector.memcheck191
  br i1 %lcmp.mod, label %vector.body168.prol.preheader, label %vector.body168.prol.loopexit.unr-lcssa

vector.body168.prol.preheader:                    ; preds = %vector.body168.preheader
  br label %vector.body168.prol

vector.body168.prol:                              ; preds = %vector.body168.prol.preheader
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 0
  %143 = bitcast double* %142 to <2 x i64>*
  %wide.load201.prol = load <2 x i64>, <2 x i64>* %143, align 8, !alias.scope !15
  %144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 2
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load202.prol = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !15
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 0
  %147 = bitcast double* %146 to <2 x i64>*
  store <2 x i64> %wide.load201.prol, <2 x i64>* %147, align 8, !alias.scope !18, !noalias !15
  %148 = getelementptr [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 2
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load202.prol, <2 x i64>* %149, align 8, !alias.scope !18, !noalias !15
  br label %vector.body168.prol.loopexit.unr-lcssa

vector.body168.prol.loopexit.unr-lcssa:           ; preds = %vector.body168.preheader, %vector.body168.prol
  %index193.unr.ph = phi i64 [ 4, %vector.body168.prol ], [ 0, %vector.body168.preheader ]
  br label %vector.body168.prol.loopexit

vector.body168.prol.loopexit:                     ; preds = %vector.body168.prol.loopexit.unr-lcssa
  br i1 %141, label %middle.block169, label %vector.body168.preheader.new

vector.body168.preheader.new:                     ; preds = %vector.body168.prol.loopexit
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168, %vector.body168.preheader.new
  %index193 = phi i64 [ %index193.unr.ph, %vector.body168.preheader.new ], [ %index.next194.1, %vector.body168 ]
  %150 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %index193
  %151 = bitcast double* %150 to <2 x i64>*
  %wide.load201 = load <2 x i64>, <2 x i64>* %151, align 8, !alias.scope !15
  %152 = getelementptr double, double* %150, i64 2
  %153 = bitcast double* %152 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !15
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %index193
  %155 = bitcast double* %154 to <2 x i64>*
  store <2 x i64> %wide.load201, <2 x i64>* %155, align 8, !alias.scope !18, !noalias !15
  %156 = getelementptr double, double* %154, i64 2
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %wide.load202, <2 x i64>* %157, align 8, !alias.scope !18, !noalias !15
  %index.next194 = add i64 %index193, 4
  %158 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %index.next194
  %159 = bitcast double* %158 to <2 x i64>*
  %wide.load201.1 = load <2 x i64>, <2 x i64>* %159, align 8, !alias.scope !15
  %160 = getelementptr double, double* %158, i64 2
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load202.1 = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !15
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %index.next194
  %163 = bitcast double* %162 to <2 x i64>*
  store <2 x i64> %wide.load201.1, <2 x i64>* %163, align 8, !alias.scope !18, !noalias !15
  %164 = getelementptr double, double* %162, i64 2
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load202.1, <2 x i64>* %165, align 8, !alias.scope !18, !noalias !15
  %index.next194.1 = add i64 %index193, 8
  %166 = icmp eq i64 %index.next194.1, %n.vec174
  br i1 %166, label %middle.block169.unr-lcssa, label %vector.body168, !llvm.loop !20

middle.block169.unr-lcssa:                        ; preds = %vector.body168
  br label %middle.block169

middle.block169:                                  ; preds = %vector.body168.prol.loopexit, %middle.block169.unr-lcssa
  br i1 %cmp.n196, label %._crit_edge.us, label %scalar.ph170.preheader

scalar.ph170.preheader:                           ; preds = %middle.block169, %vector.memcheck191, %min.iters.checked172, %.lr.ph12.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck191 ], [ 0, %min.iters.checked172 ], [ 0, %.lr.ph12.split.us ], [ %n.vec174, %middle.block169 ]
  %167 = sub nsw i64 %139, %indvars.iv.ph
  %168 = sub nsw i64 %wide.trip.count104, %indvars.iv.ph
  %xtraiter205 = and i64 %167, 3
  %lcmp.mod206 = icmp eq i64 %xtraiter205, 0
  br i1 %lcmp.mod206, label %scalar.ph170.prol.loopexit, label %scalar.ph170.prol.preheader

scalar.ph170.prol.preheader:                      ; preds = %scalar.ph170.preheader
  br label %scalar.ph170.prol

scalar.ph170.prol:                                ; preds = %scalar.ph170.prol, %scalar.ph170.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph170.prol ], [ %indvars.iv.ph, %scalar.ph170.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph170.prol ], [ %xtraiter205, %scalar.ph170.prol.preheader ]
  %169 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %indvars.iv.prol
  %170 = bitcast double* %169 to i64*
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %indvars.iv.prol
  %173 = bitcast double* %172 to i64*
  store i64 %171, i64* %173, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph170.prol.loopexit.unr-lcssa, label %scalar.ph170.prol, !llvm.loop !21

scalar.ph170.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph170.prol
  br label %scalar.ph170.prol.loopexit

scalar.ph170.prol.loopexit:                       ; preds = %scalar.ph170.preheader, %scalar.ph170.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph170.preheader ], [ %indvars.iv.next.prol, %scalar.ph170.prol.loopexit.unr-lcssa ]
  %174 = icmp ult i64 %168, 3
  br i1 %174, label %._crit_edge.us.loopexit, label %scalar.ph170.preheader.new

scalar.ph170.preheader.new:                       ; preds = %scalar.ph170.prol.loopexit
  br label %scalar.ph170

scalar.ph170:                                     ; preds = %scalar.ph170, %scalar.ph170.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph170.preheader.new ], [ %indvars.iv.next.3, %scalar.ph170 ]
  %175 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %176 = bitcast double* %175 to i64*
  %177 = load i64, i64* %176, align 8
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %indvars.iv
  %179 = bitcast double* %178 to i64*
  store i64 %177, i64* %179, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %180 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %181 = bitcast double* %180 to i64*
  %182 = load i64, i64* %181, align 8
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %indvars.iv.next
  %184 = bitcast double* %183 to i64*
  store i64 %182, i64* %184, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %190 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %130, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %191 = bitcast double* %190 to i64*
  %192 = load i64, i64* %191, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %129, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %194 = bitcast double* %193 to i64*
  store i64 %192, i64* %194, align 8
  %exitcond105.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count104
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond105.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph170, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph170
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph170.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block169
  %indvars.iv.next107 = add i64 %indvars.iv106, 1
  %195 = icmp slt i64 %indvars.iv.next107, %133
  %indvar.next178 = add i64 %indvar177, 1
  br i1 %195, label %.lr.ph12.split.us, label %._crit_edge.us.._crit_edge13_crit_edge

._crit_edge.us.._crit_edge13_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge13

.lr.ph12.split.._crit_edge13_crit_edge:           ; preds = %.lr.ph12
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.lr.ph12.split.._crit_edge13_crit_edge, %._crit_edge.us.._crit_edge13_crit_edge
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge87, %._crit_edge87.thread, %._crit_edge13
  %196 = phi i8* [ %128, %._crit_edge87 ], [ %.pre, %._crit_edge87.thread ], [ %128, %._crit_edge13 ]
  call void @free(i8* %196) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph60, label %._crit_edge70

.lr.ph60:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count124 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count124, 1
  br label %10

; <label>:10:                                     ; preds = %._crit_edge54, %.lr.ph60
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge54 ], [ 0, %.lr.ph60 ]
  %indvars.iv133 = phi i32 [ %15, %._crit_edge54 ], [ -1, %.lr.ph60 ]
  %11 = add i64 %indvars.iv141, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = sub i64 %9, %indvars.iv141
  %14 = sub i64 %wide.trip.count124, %indvars.iv141
  %15 = add i32 %indvars.iv133, 1
  %16 = icmp sgt i64 %indvars.iv141, 0
  br i1 %16, label %.lr.ph40.preheader, label %._crit_edge41

.lr.ph40.preheader:                               ; preds = %10
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 0
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %._crit_edge71
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge71 ], [ 0, %.lr.ph40.preheader ]
  %indvars.iv114 = phi i32 [ %20, %._crit_edge71 ], [ -1, %.lr.ph40.preheader ]
  %18 = add i64 %indvars.iv118, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = add i32 %indvars.iv114, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv118
  %22 = load double, double* %21, align 8
  %23 = icmp sgt i64 %indvars.iv118, 0
  br i1 %23, label %.lr.ph34, label %._crit_edge71

.lr.ph34:                                         ; preds = %.lr.ph40
  %wide.trip.count116 = zext i32 %indvars.iv114 to i64
  %24 = and i64 %18, 1
  %lcmp.mod175 = icmp eq i64 %24, 0
  br i1 %lcmp.mod175, label %.prol.preheader172, label %.prol.loopexit173.unr-lcssa

.prol.preheader172:                               ; preds = %.lr.ph34
  br label %25

; <label>:25:                                     ; preds = %.prol.preheader172
  %26 = load double, double* %17, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv118
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %22, %29
  br label %.prol.loopexit173.unr-lcssa

.prol.loopexit173.unr-lcssa:                      ; preds = %.lr.ph34, %25
  %.lcssa163.unr.ph = phi double [ %30, %25 ], [ undef, %.lr.ph34 ]
  %indvars.iv108.unr.ph = phi i64 [ 1, %25 ], [ 0, %.lr.ph34 ]
  %.unr176.ph = phi double [ %30, %25 ], [ %22, %.lr.ph34 ]
  br label %.prol.loopexit173

.prol.loopexit173:                                ; preds = %.prol.loopexit173.unr-lcssa
  %31 = icmp eq i64 %19, 0
  br i1 %31, label %._crit_edge35, label %.lr.ph34.new

.lr.ph34.new:                                     ; preds = %.prol.loopexit173
  br label %32

; <label>:32:                                     ; preds = %32, %.lr.ph34.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %.lr.ph34.new ], [ %indvars.iv.next109.1, %32 ]
  %33 = phi double [ %.unr176.ph, %.lr.ph34.new ], [ %47, %32 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv108
  %35 = bitcast double* %34 to <2 x double>*
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv118
  %37 = load double, double* %36, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %38 = load <2 x double>, <2 x double>* %35, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv118
  %40 = load double, double* %39, align 8
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %38, %42
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %46 = fsub double %33, %44
  %47 = fsub double %46, %45
  %exitcond117.1 = icmp eq i64 %indvars.iv.next109, %wide.trip.count116
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond117.1, label %._crit_edge35.unr-lcssa, label %32

._crit_edge35.unr-lcssa:                          ; preds = %32
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %.prol.loopexit173, %._crit_edge35.unr-lcssa
  %.lcssa163 = phi double [ %.lcssa163.unr.ph, %.prol.loopexit173 ], [ %47, %._crit_edge35.unr-lcssa ]
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %.lr.ph40, %._crit_edge35
  %48 = phi double [ %.lcssa163, %._crit_edge35 ], [ %22, %.lr.ph40 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv118, i64 %indvars.iv118
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %21, align 8
  %indvars.iv.next119 = add nuw i64 %indvars.iv118, 1
  %52 = icmp slt i64 %indvars.iv.next119, %indvars.iv141
  br i1 %52, label %.lr.ph40, label %._crit_edge41.loopexit

._crit_edge41.loopexit:                           ; preds = %._crit_edge71
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %10
  %53 = icmp slt i64 %indvars.iv141, %8
  br i1 %53, label %.lr.ph53, label %._crit_edge54

.lr.ph53:                                         ; preds = %._crit_edge41
  br i1 %16, label %.lr.ph53.split.us.preheader, label %.lr.ph53.split.preheader

.lr.ph53.split.preheader:                         ; preds = %.lr.ph53
  %xtraiter177 = and i64 %13, 7
  %lcmp.mod178 = icmp eq i64 %xtraiter177, 0
  br i1 %lcmp.mod178, label %.lr.ph53.split.prol.loopexit, label %.lr.ph53.split.prol.preheader

.lr.ph53.split.prol.preheader:                    ; preds = %.lr.ph53.split.preheader
  br label %.lr.ph53.split.prol

.lr.ph53.split.prol:                              ; preds = %.lr.ph53.split.prol, %.lr.ph53.split.prol.preheader
  %indvars.iv122.prol = phi i64 [ %indvars.iv.next123.prol, %.lr.ph53.split.prol ], [ %indvars.iv141, %.lr.ph53.split.prol.preheader ]
  %prol.iter179 = phi i64 [ %prol.iter179.sub, %.lr.ph53.split.prol ], [ %xtraiter177, %.lr.ph53.split.prol.preheader ]
  %indvars.iv.next123.prol = add i64 %indvars.iv122.prol, 1
  %prol.iter179.sub = add i64 %prol.iter179, -1
  %prol.iter179.cmp = icmp eq i64 %prol.iter179.sub, 0
  br i1 %prol.iter179.cmp, label %.lr.ph53.split.prol.loopexit.unr-lcssa, label %.lr.ph53.split.prol, !llvm.loop !23

.lr.ph53.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph53.split.prol
  br label %.lr.ph53.split.prol.loopexit

.lr.ph53.split.prol.loopexit:                     ; preds = %.lr.ph53.split.preheader, %.lr.ph53.split.prol.loopexit.unr-lcssa
  %indvars.iv122.unr = phi i64 [ %indvars.iv141, %.lr.ph53.split.preheader ], [ %indvars.iv.next123.prol, %.lr.ph53.split.prol.loopexit.unr-lcssa ]
  %54 = icmp ult i64 %14, 7
  br i1 %54, label %._crit_edge54.loopexit144, label %.lr.ph53.split.preheader.new

.lr.ph53.split.preheader.new:                     ; preds = %.lr.ph53.split.prol.loopexit
  br label %.lr.ph53.split

.lr.ph53.split.us.preheader:                      ; preds = %.lr.ph53
  %wide.trip.count135 = zext i32 %indvars.iv133 to i64
  %55 = and i64 %11, 1
  %lcmp.mod183 = icmp eq i64 %55, 0
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 0
  %57 = icmp eq i64 %12, 0
  br label %.lr.ph53.split.us

.lr.ph53.split.us:                                ; preds = %.lr.ph53.split.us.preheader, %._crit_edge47.us
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge47.us ], [ %indvars.iv141, %.lr.ph53.split.us.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv139
  %59 = load double, double* %58, align 8
  br i1 %lcmp.mod183, label %.prol.preheader180, label %.prol.loopexit181.unr-lcssa

.prol.preheader180:                               ; preds = %.lr.ph53.split.us
  br label %60

; <label>:60:                                     ; preds = %.prol.preheader180
  %61 = load double, double* %56, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv139
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  br label %.prol.loopexit181.unr-lcssa

.prol.loopexit181.unr-lcssa:                      ; preds = %.lr.ph53.split.us, %60
  %.lcssa165.unr.ph = phi double [ %65, %60 ], [ undef, %.lr.ph53.split.us ]
  %indvars.iv127.unr.ph = phi i64 [ 1, %60 ], [ 0, %.lr.ph53.split.us ]
  %.unr184.ph = phi double [ %65, %60 ], [ %59, %.lr.ph53.split.us ]
  br label %.prol.loopexit181

.prol.loopexit181:                                ; preds = %.prol.loopexit181.unr-lcssa
  br i1 %57, label %._crit_edge47.us, label %.lr.ph53.split.us.new

.lr.ph53.split.us.new:                            ; preds = %.prol.loopexit181
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph53.split.us.new
  %indvars.iv127 = phi i64 [ %indvars.iv127.unr.ph, %.lr.ph53.split.us.new ], [ %indvars.iv.next128.1, %66 ]
  %67 = phi double [ %.unr184.ph, %.lr.ph53.split.us.new ], [ %81, %66 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv127
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv139
  %71 = load double, double* %70, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next128, i64 %indvars.iv139
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %67, %78
  %81 = fsub double %80, %79
  %exitcond136.1 = icmp eq i64 %indvars.iv.next128, %wide.trip.count135
  %indvars.iv.next128.1 = add nsw i64 %indvars.iv127, 2
  br i1 %exitcond136.1, label %._crit_edge47.us.unr-lcssa, label %66

._crit_edge47.us.unr-lcssa:                       ; preds = %66
  br label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %.prol.loopexit181, %._crit_edge47.us.unr-lcssa
  %.lcssa165 = phi double [ %.lcssa165.unr.ph, %.prol.loopexit181 ], [ %81, %._crit_edge47.us.unr-lcssa ]
  store double %.lcssa165, double* %58, align 8
  %indvars.iv.next140 = add i64 %indvars.iv139, 1
  %82 = icmp slt i64 %indvars.iv.next140, %8
  br i1 %82, label %.lr.ph53.split.us, label %._crit_edge54.loopexit

.lr.ph53.split:                                   ; preds = %.lr.ph53.split, %.lr.ph53.split.preheader.new
  %indvars.iv122 = phi i64 [ %indvars.iv122.unr, %.lr.ph53.split.preheader.new ], [ %indvars.iv.next123.7, %.lr.ph53.split ]
  %indvars.iv.next123.6 = add i64 %indvars.iv122, 7
  %exitcond125.7 = icmp eq i64 %indvars.iv.next123.6, %wide.trip.count124
  %indvars.iv.next123.7 = add i64 %indvars.iv122, 8
  br i1 %exitcond125.7, label %._crit_edge54.loopexit144.unr-lcssa, label %.lr.ph53.split

._crit_edge54.loopexit144.unr-lcssa:              ; preds = %.lr.ph53.split
  br label %._crit_edge54.loopexit144

._crit_edge54.loopexit144:                        ; preds = %.lr.ph53.split.prol.loopexit, %._crit_edge54.loopexit144.unr-lcssa
  br label %._crit_edge54

._crit_edge54.loopexit:                           ; preds = %._crit_edge47.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %._crit_edge54.loopexit144, %._crit_edge41
  %indvars.iv.next142 = add i64 %indvars.iv141, 1
  %83 = icmp slt i64 %indvars.iv.next142, %8
  br i1 %83, label %10, label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge54
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %5, %._crit_edge61
  br i1 %6, label %.lr.ph27, label %._crit_edge76.thread

._crit_edge76.thread:                             ; preds = %._crit_edge70
  br label %._crit_edge80

.lr.ph27:                                         ; preds = %._crit_edge70
  %84 = sext i32 %0 to i64
  br label %85

; <label>:85:                                     ; preds = %._crit_edge77, %.lr.ph27
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge77 ], [ 0, %.lr.ph27 ]
  %indvars.iv102 = phi i32 [ %indvars.iv.next103, %._crit_edge77 ], [ -1, %.lr.ph27 ]
  %86 = add i64 %indvars.iv106, 4294967295
  %87 = and i64 %86, 4294967295
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv106
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = icmp sgt i64 %indvars.iv106, 0
  %92 = bitcast i64 %90 to double
  br i1 %91, label %.lr.ph21, label %._crit_edge77

.lr.ph21:                                         ; preds = %85
  %wide.trip.count104 = zext i32 %indvars.iv102 to i64
  %xtraiter168 = and i64 %indvars.iv106, 3
  %lcmp.mod169 = icmp eq i64 %xtraiter168, 0
  br i1 %lcmp.mod169, label %.prol.loopexit167, label %.prol.preheader166

.prol.preheader166:                               ; preds = %.lr.ph21
  br label %93

; <label>:93:                                     ; preds = %93, %.prol.preheader166
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %93 ], [ 0, %.prol.preheader166 ]
  %94 = phi double [ %100, %93 ], [ %92, %.prol.preheader166 ]
  %prol.iter170 = phi i64 [ %prol.iter170.sub, %93 ], [ %xtraiter168, %.prol.preheader166 ]
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv96.prol
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds double, double* %4, i64 %indvars.iv96.prol
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fsub double %94, %99
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter170.sub = add i64 %prol.iter170, -1
  %prol.iter170.cmp = icmp eq i64 %prol.iter170.sub, 0
  br i1 %prol.iter170.cmp, label %.prol.loopexit167.unr-lcssa, label %93, !llvm.loop !24

.prol.loopexit167.unr-lcssa:                      ; preds = %93
  br label %.prol.loopexit167

.prol.loopexit167:                                ; preds = %.lr.ph21, %.prol.loopexit167.unr-lcssa
  %.lcssa161.unr = phi double [ undef, %.lr.ph21 ], [ %100, %.prol.loopexit167.unr-lcssa ]
  %indvars.iv96.unr = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next97.prol, %.prol.loopexit167.unr-lcssa ]
  %.unr171 = phi double [ %92, %.lr.ph21 ], [ %100, %.prol.loopexit167.unr-lcssa ]
  %101 = icmp ult i64 %87, 3
  br i1 %101, label %._crit_edge22, label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.prol.loopexit167
  br label %102

; <label>:102:                                    ; preds = %102, %.lr.ph21.new
  %indvars.iv96 = phi i64 [ %indvars.iv96.unr, %.lr.ph21.new ], [ %indvars.iv.next97.3, %102 ]
  %103 = phi double [ %.unr171, %.lr.ph21.new ], [ %125, %102 ]
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv96
  %105 = bitcast double* %104 to <2 x double>*
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv96
  %107 = bitcast double* %106 to <2 x double>*
  %108 = load <2 x double>, <2 x double>* %105, align 8
  %109 = load <2 x double>, <2 x double>* %107, align 8
  %110 = fmul <2 x double> %108, %109
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %113 = fsub double %103, %111
  %114 = fsub double %113, %112
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next97.1
  %116 = bitcast double* %115 to <2 x double>*
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next97.1
  %118 = bitcast double* %117 to <2 x double>*
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %119 = load <2 x double>, <2 x double>* %116, align 8
  %120 = load <2 x double>, <2 x double>* %118, align 8
  %121 = fmul <2 x double> %119, %120
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fsub double %114, %122
  %125 = fsub double %124, %123
  %exitcond105.3 = icmp eq i64 %indvars.iv.next97.2, %wide.trip.count104
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  br i1 %exitcond105.3, label %._crit_edge22.unr-lcssa, label %102

._crit_edge22.unr-lcssa:                          ; preds = %102
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.prol.loopexit167, %._crit_edge22.unr-lcssa
  %.lcssa161 = phi double [ %.lcssa161.unr, %.prol.loopexit167 ], [ %125, %._crit_edge22.unr-lcssa ]
  %126 = bitcast double %.lcssa161 to i64
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %85, %._crit_edge22
  %127 = phi i64 [ %90, %85 ], [ %126, %._crit_edge22 ]
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv106
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next107 = add i64 %indvars.iv106, 1
  %130 = icmp slt i64 %indvars.iv.next107, %84
  %indvars.iv.next103 = add i32 %indvars.iv102, 1
  br i1 %130, label %85, label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge77
  br i1 true, label %.lr.ph14, label %._crit_edge76.._crit_edge80_crit_edge

._crit_edge76.._crit_edge80_crit_edge:            ; preds = %._crit_edge76
  br label %._crit_edge80

.lr.ph14:                                         ; preds = %._crit_edge76
  %storemerge212 = add i32 %0, -1
  %131 = sext i32 %storemerge212 to i64
  %132 = add nsw i64 %131, 1
  br label %133

; <label>:133:                                    ; preds = %._crit_edge81, %.lr.ph14
  %indvar = phi i32 [ %indvar.next, %._crit_edge81 ], [ 0, %.lr.ph14 ]
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge81 ], [ %131, %.lr.ph14 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge81 ], [ %0, %.lr.ph14 ]
  %134 = sub i32 %0, %indvar
  %135 = sext i32 %134 to i64
  %136 = sub nsw i64 %131, %135
  %137 = getelementptr inbounds double, double* %4, i64 %indvars.iv93
  %138 = load double, double* %137, align 8
  %139 = add nsw i64 %indvars.iv93, 1
  %140 = icmp slt i64 %139, %84
  br i1 %140, label %.lr.ph, label %._crit_edge81

.lr.ph:                                           ; preds = %133
  %141 = sub nsw i64 %132, %135
  %142 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %141, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %143

; <label>:143:                                    ; preds = %143, %.prol.preheader
  %indvars.iv91.prol = phi i64 [ %indvars.iv.next92.prol, %143 ], [ %142, %.prol.preheader ]
  %144 = phi double [ %150, %143 ], [ %138, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %143 ], [ %xtraiter, %.prol.preheader ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv91.prol
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv91.prol
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fsub double %144, %149
  %indvars.iv.next92.prol = add nsw i64 %indvars.iv91.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %143, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %143
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %150, %.prol.loopexit.unr-lcssa ]
  %indvars.iv91.unr = phi i64 [ %142, %.lr.ph ], [ %indvars.iv.next92.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %138, %.lr.ph ], [ %150, %.prol.loopexit.unr-lcssa ]
  %151 = icmp ult i64 %136, 3
  br i1 %151, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %152

; <label>:152:                                    ; preds = %152, %.lr.ph.new
  %indvars.iv91 = phi i64 [ %indvars.iv91.unr, %.lr.ph.new ], [ %indvars.iv.next92.3, %152 ]
  %153 = phi double [ %.unr, %.lr.ph.new ], [ %175, %152 ]
  %154 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv91
  %155 = bitcast double* %154 to <2 x double>*
  %156 = getelementptr inbounds double, double* %3, i64 %indvars.iv91
  %157 = bitcast double* %156 to <2 x double>*
  %158 = load <2 x double>, <2 x double>* %155, align 8
  %159 = load <2 x double>, <2 x double>* %157, align 8
  %160 = fmul <2 x double> %158, %159
  %161 = extractelement <2 x double> %160, i32 0
  %162 = extractelement <2 x double> %160, i32 1
  %163 = fsub double %153, %161
  %164 = fsub double %163, %162
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next92.1
  %166 = bitcast double* %165 to <2 x double>*
  %167 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next92.1
  %168 = bitcast double* %167 to <2 x double>*
  %indvars.iv.next92.2 = add nsw i64 %indvars.iv91, 3
  %169 = load <2 x double>, <2 x double>* %166, align 8
  %170 = load <2 x double>, <2 x double>* %168, align 8
  %171 = fmul <2 x double> %169, %170
  %172 = extractelement <2 x double> %171, i32 0
  %173 = extractelement <2 x double> %171, i32 1
  %174 = fsub double %164, %172
  %175 = fsub double %174, %173
  %exitcond.3 = icmp eq i64 %indvars.iv.next92.2, %131
  %indvars.iv.next92.3 = add nsw i64 %indvars.iv91, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %152

._crit_edge.unr-lcssa:                            ; preds = %152
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %175, %._crit_edge.unr-lcssa ]
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %133, %._crit_edge
  %176 = phi double [ %138, %133 ], [ %.lcssa, %._crit_edge ]
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv93
  %178 = load double, double* %177, align 8
  %179 = fdiv double %176, %178
  %180 = getelementptr inbounds double, double* %3, i64 %indvars.iv93
  store double %179, double* %180, align 8
  %indvars.iv.next94 = add i64 %indvars.iv93, -1
  %181 = icmp sgt i64 %indvars.iv93, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %181, label %133, label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge81
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge76.._crit_edge80_crit_edge, %._crit_edge76.thread, %._crit_edge15
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
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
