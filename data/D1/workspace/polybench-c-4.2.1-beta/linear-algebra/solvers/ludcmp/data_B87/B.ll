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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph64:
  %5 = alloca [2000 x double]*, align 8
  store [2000 x double]* %1, [2000 x double]** %5, align 8
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77, %.lr.ph64
  %indvars.iv123 = phi i64 [ 0, %.lr.ph64 ], [ %indvars.iv.next124.1, %._crit_edge77 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv123
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv123
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next124 = or i64 %indvars.iv123, 1
  %10 = trunc i64 %indvars.iv.next124 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv123
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %13 = trunc i64 %indvars.iv.next124.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %21 = icmp slt i64 %indvars.iv.next124.1, 2000
  br i1 %21, label %._crit_edge77, label %._crit_edge11.preheader

._crit_edge11.preheader:                          ; preds = %._crit_edge77
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.preheader, %._crit_edge54
  %22 = phi [2000 x double]* [ %38, %._crit_edge54 ], [ %1, %._crit_edge11.preheader ]
  %23 = phi i32 [ %storemerge1051, %._crit_edge54 ], [ 0, %._crit_edge11.preheader ]
  %24 = add i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = sub nsw i64 1999, %25
  %27 = icmp slt i32 %23, 0
  %.pre134 = sext i32 %23 to i64
  br i1 %27, label %._crit_edge48, label %.lr.ph47

.lr.ph47:                                         ; preds = %._crit_edge11
  %wide.trip.count119 = zext i32 %23 to i64
  br label %28

; <label>:28:                                     ; preds = %28, %.lr.ph47
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %28 ], [ 0, %.lr.ph47 ]
  %29 = sub nsw i64 0, %indvars.iv117
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 %.pre134, i64 %indvars.iv117
  store double %34, double* %35, align 8
  %exitcond120 = icmp eq i64 %indvars.iv117, %wide.trip.count119
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br i1 %exitcond120, label %.._crit_edge48_crit_edge, label %28

.._crit_edge48_crit_edge:                         ; preds = %28
  %.pre = load [2000 x double]*, [2000 x double]** %5, align 8
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge11, %.._crit_edge48_crit_edge
  %36 = phi [2000 x double]* [ %.pre, %.._crit_edge48_crit_edge ], [ %22, %._crit_edge11 ]
  %storemerge1051 = add nsw i32 %23, 1
  %37 = icmp slt i32 %storemerge1051, 2000
  br i1 %37, label %.lr.ph53, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge

.lr.ph53:                                         ; preds = %._crit_edge48
  %38 = load [2000 x double]*, [2000 x double]** %5, align 8
  %39 = sext i32 %storemerge1051 to i64
  %40 = sub nsw i64 0, %25
  %xtraiter = and i64 %40, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph53
  br label %41

; <label>:41:                                     ; preds = %41, %.prol.preheader
  %indvars.iv121.prol = phi i64 [ %indvars.iv.next122.prol, %41 ], [ %39, %.prol.preheader ]
  %42 = phi [2000 x double]* [ %38, %41 ], [ %36, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %41 ], [ %xtraiter, %.prol.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %.pre134, i64 %indvars.iv121.prol
  store double 0.000000e+00, double* %43, align 8
  %indvars.iv.next122.prol = add nsw i64 %indvars.iv121.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %41, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %41
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph53, %.prol.loopexit.unr-lcssa
  %indvars.iv121.unr = phi i64 [ %39, %.lr.ph53 ], [ %indvars.iv.next122.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %36, %.lr.ph53 ], [ %38, %.prol.loopexit.unr-lcssa ]
  %44 = icmp ult i64 %26, 7
  br i1 %44, label %._crit_edge54, label %.lr.ph53.new

.lr.ph53.new:                                     ; preds = %.prol.loopexit
  br label %45

; <label>:45:                                     ; preds = %45, %.lr.ph53.new
  %indvars.iv121 = phi i64 [ %indvars.iv121.unr, %.lr.ph53.new ], [ %indvars.iv.next122.7, %45 ]
  %46 = phi [2000 x double]* [ %.unr, %.lr.ph53.new ], [ %38, %45 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 %.pre134, i64 %indvars.iv121
  store double 0.000000e+00, double* %47, align 8
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122
  store double 0.000000e+00, double* %48, align 8
  %indvars.iv.next122.1 = add nsw i64 %indvars.iv121, 2
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.1
  store double 0.000000e+00, double* %49, align 8
  %indvars.iv.next122.2 = add nsw i64 %indvars.iv121, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.2
  store double 0.000000e+00, double* %50, align 8
  %indvars.iv.next122.3 = add nsw i64 %indvars.iv121, 4
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.3
  store double 0.000000e+00, double* %51, align 8
  %indvars.iv.next122.4 = add nsw i64 %indvars.iv121, 5
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.4
  store double 0.000000e+00, double* %52, align 8
  %indvars.iv.next122.5 = add nsw i64 %indvars.iv121, 6
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.5
  store double 0.000000e+00, double* %53, align 8
  %indvars.iv.next122.6 = add nsw i64 %indvars.iv121, 7
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %indvars.iv.next122.6
  store double 0.000000e+00, double* %54, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next122.6, 1999
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  br i1 %exitcond.7, label %._crit_edge54.unr-lcssa, label %45

._crit_edge54.unr-lcssa:                          ; preds = %45
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %.prol.loopexit, %._crit_edge54.unr-lcssa
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 %.pre134, i64 %.pre134
  store double 1.000000e+00, double* %55, align 8
  br label %._crit_edge11

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge:   ; preds = %._crit_edge48
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i64 %.pre134, i64 %.pre134
  store double 1.000000e+00, double* %56, align 8
  %57 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %58 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %59 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %60 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %61 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %62 = bitcast i8* %57 to [2000 x [2000 x double]]*
  %63 = bitcast i8* %57 to [2000 x [2000 x double]]*
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge
  %indvars.iv114 = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvars.iv.next115.4, %._crit_edge12.us ]
  %indvar = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvar.next.4, %._crit_edge12.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvar, i64 0
  %scevgep113 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvar.next, i64 0
  %scevgep113.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %61, i64 0, i64 %indvar.next.1, i64 0
  %scevgep113.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvar.next.2, i64 0
  %scevgep113.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvar.next.3, i64 0
  %scevgep113.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next115.4 = add nsw i64 %indvars.iv114, 5
  %64 = icmp slt i64 %indvars.iv.next115.4, 2000
  %indvar.next.4 = add nsw i64 %indvar, 5
  br i1 %64, label %._crit_edge12.us, label %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge

._crit_edge14.lr.ph.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge12.us
  %65 = load [2000 x double]*, [2000 x double]** %5, align 8
  br label %._crit_edge14.us.._crit_edge16.us.us_crit_edge

._crit_edge14.us.._crit_edge16.us.us_crit_edge:   ; preds = %._crit_edge29.us, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge
  %indvars.iv108 = phi i64 [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ], [ %indvars.iv.next109, %._crit_edge29.us ]
  br label %._crit_edge16.us.us

._crit_edge29.us:                                 ; preds = %._crit_edge27.us.us
  %indvars.iv.next109 = add i64 %indvars.iv108, 1
  %66 = icmp slt i64 %indvars.iv.next109, 2000
  br i1 %66, label %._crit_edge14.us.._crit_edge16.us.us_crit_edge, label %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge27.us.us, %._crit_edge14.us.._crit_edge16.us.us_crit_edge
  %indvars.iv106 = phi i64 [ 0, %._crit_edge14.us.._crit_edge16.us.us_crit_edge ], [ %indvars.iv.next107, %._crit_edge27.us.us ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv106, i64 %indvars.iv108
  br label %69

._crit_edge27.us.us:                              ; preds = %69
  %indvars.iv.next107 = add nuw i64 %indvars.iv106, 1
  %68 = icmp slt i64 %indvars.iv.next107, 2000
  br i1 %68, label %._crit_edge16.us.us, label %._crit_edge29.us

; <label>:69:                                     ; preds = %69, %._crit_edge16.us.us
  %indvars.iv102 = phi i64 [ 0, %._crit_edge16.us.us ], [ %indvars.iv.next103.1, %69 ]
  %70 = load double, double* %67, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv102, i64 %indvars.iv108
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv106, i64 %indvars.iv102
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %73
  store double %76, double* %74, align 8
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %77 = load double, double* %67, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv.next103, i64 %indvars.iv108
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next103
  %82 = load double, double* %81, align 8
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103, 1999
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  br i1 %exitcond105.1, label %._crit_edge27.us.us, label %69

._crit_edge17.lr.ph.._crit_edge17.us_crit_edge:   ; preds = %._crit_edge29.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge19.us, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge
  %indvars.iv100 = phi i64 [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ], [ %84, %._crit_edge19.us ]
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 0
  %84 = add i64 %indvars.iv100, 1
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %65, i64 %84, i64 0
  %scevgep144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 0
  %scevgep146 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %84, i64 0
  %bound0 = icmp ult double* %scevgep140, %scevgep146
  %bound1 = icmp ult double* %scevgep144, %scevgep142
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge17.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge17.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %index
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !3
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load149 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !3
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %index
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %90, align 8, !alias.scope !6, !noalias !3
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load149, <2 x i64>* %92, align 8, !alias.scope !6, !noalias !3
  %index.next = or i64 %index, 4
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %index.next
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !3
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load149.1 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !3
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %index.next
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %98, align 8, !alias.scope !6, !noalias !3
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load149.1, <2 x i64>* %100, align 8, !alias.scope !6, !noalias !3
  %index.next.1 = add nsw i64 %index, 8
  %101 = icmp eq i64 %index.next.1, 2000
  br i1 %101, label %._crit_edge19.us.loopexit150, label %vector.body, !llvm.loop !8

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.4, %scalar.ph ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.3
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 %indvars.iv100, i64 %indvars.iv.next.3
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %exitcond99.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond99.4, label %._crit_edge19.us.loopexit, label %scalar.ph, !llvm.loop !11

._crit_edge19.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge19.us

._crit_edge19.us.loopexit150:                     ; preds = %vector.body
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit150, %._crit_edge19.us.loopexit
  %127 = icmp slt i64 %84, 2000
  br i1 %127, label %._crit_edge17.us, label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge19.us
  tail call void @free(i8* %57) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge55, %._crit_edge.lr.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge55 ], [ 0, %._crit_edge.lr.ph ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge55 ], [ 4294967295, %._crit_edge.lr.ph ]
  %5 = sub i64 1999, %indvars.iv137
  %6 = and i64 %indvars.iv129, 4294967295
  %7 = icmp sgt i64 %indvars.iv137, 0
  br i1 %7, label %.lr.ph41.preheader, label %._crit_edge42

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge69
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge69 ], [ 0, %.lr.ph41.preheader ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge69 ], [ 4294967295, %.lr.ph41.preheader ]
  %9 = and i64 %indvars.iv110, 4294967295
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %11 = load double, double* %10, align 8
  %12 = icmp sgt i64 %indvars.iv114, 0
  br i1 %12, label %.lr.ph36.preheader, label %._crit_edge69

.lr.ph36.preheader:                               ; preds = %.lr.ph41
  %13 = and i64 %indvars.iv110, 1
  %lcmp.mod165 = icmp eq i64 %13, 0
  br i1 %lcmp.mod165, label %.lr.ph36.prol.preheader, label %.lr.ph36.prol.loopexit.unr-lcssa

.lr.ph36.prol.preheader:                          ; preds = %.lr.ph36.preheader
  br label %.lr.ph36.prol

.lr.ph36.prol:                                    ; preds = %.lr.ph36.prol.preheader
  %14 = load double, double* %8, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %11, %17
  br label %.lr.ph36.prol.loopexit.unr-lcssa

.lr.ph36.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph36.preheader, %.lr.ph36.prol
  %.lcssa156.unr.ph = phi double [ %18, %.lr.ph36.prol ], [ undef, %.lr.ph36.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph36.prol ], [ 0, %.lr.ph36.preheader ]
  %.unr166.ph = phi double [ %18, %.lr.ph36.prol ], [ %11, %.lr.ph36.preheader ]
  br label %.lr.ph36.prol.loopexit

.lr.ph36.prol.loopexit:                           ; preds = %.lr.ph36.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %9, 0
  br i1 %19, label %._crit_edge69.loopexit, label %.lr.ph36.preheader.new

.lr.ph36.preheader.new:                           ; preds = %.lr.ph36.prol.loopexit
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph36.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph36 ]
  %20 = phi double [ %.unr166.ph, %.lr.ph36.preheader.new ], [ %34, %.lr.ph36 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %22 = bitcast double* %21 to <2 x double>*
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %24 = load double, double* %23, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %25 = load <2 x double>, <2 x double>* %22, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %25, %29
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %20, %31
  %34 = fsub double %33, %32
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %9
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge69.loopexit.unr-lcssa, label %.lr.ph36

._crit_edge69.loopexit.unr-lcssa:                 ; preds = %.lr.ph36
  br label %._crit_edge69.loopexit

._crit_edge69.loopexit:                           ; preds = %.lr.ph36.prol.loopexit, %._crit_edge69.loopexit.unr-lcssa
  %.lcssa156 = phi double [ %.lcssa156.unr.ph, %.lr.ph36.prol.loopexit ], [ %34, %._crit_edge69.loopexit.unr-lcssa ]
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69.loopexit, %.lr.ph41
  %35 = phi double [ %11, %.lr.ph41 ], [ %.lcssa156, %._crit_edge69.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %10, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %39 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  %indvars.iv.next111 = add nuw nsw i64 %9, 1
  br i1 %39, label %.lr.ph41, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge69
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %._crit_edge
  %40 = icmp slt i64 %indvars.iv137, 2000
  br i1 %40, label %.lr.ph54, label %._crit_edge55

.lr.ph54:                                         ; preds = %._crit_edge42
  br i1 %7, label %.lr.ph54.split.us.preheader, label %.lr.ph54.split.preheader

.lr.ph54.split.preheader:                         ; preds = %.lr.ph54
  %41 = sub i64 0, %indvars.iv137
  %xtraiter167 = and i64 %41, 7
  %lcmp.mod168 = icmp eq i64 %xtraiter167, 0
  br i1 %lcmp.mod168, label %.lr.ph54.split.prol.loopexit, label %.lr.ph54.split.prol.preheader

.lr.ph54.split.prol.preheader:                    ; preds = %.lr.ph54.split.preheader
  br label %.lr.ph54.split.prol

.lr.ph54.split.prol:                              ; preds = %.lr.ph54.split.prol, %.lr.ph54.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph54.split.prol ], [ %indvars.iv137, %.lr.ph54.split.prol.preheader ]
  %prol.iter169 = phi i64 [ %prol.iter169.sub, %.lr.ph54.split.prol ], [ %xtraiter167, %.lr.ph54.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter169.sub = add i64 %prol.iter169, -1
  %prol.iter169.cmp = icmp eq i64 %prol.iter169.sub, 0
  br i1 %prol.iter169.cmp, label %.lr.ph54.split.prol.loopexit.unr-lcssa, label %.lr.ph54.split.prol, !llvm.loop !12

.lr.ph54.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph54.split.prol
  br label %.lr.ph54.split.prol.loopexit

.lr.ph54.split.prol.loopexit:                     ; preds = %.lr.ph54.split.preheader, %.lr.ph54.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph54.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph54.split.prol.loopexit.unr-lcssa ]
  %42 = icmp ult i64 %5, 7
  br i1 %42, label %._crit_edge55.loopexit151, label %.lr.ph54.split.preheader.new

.lr.ph54.split.preheader.new:                     ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph54.split

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %43 = and i64 %indvars.iv129, 1
  %lcmp.mod173 = icmp eq i64 %43, 0
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %45 = icmp eq i64 %6, 0
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge48.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge48.us ], [ %indvars.iv137, %.lr.ph54.split.us.preheader ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %47 = load double, double* %46, align 8
  br i1 %lcmp.mod173, label %.prol.preheader170, label %.prol.loopexit171.unr-lcssa

.prol.preheader170:                               ; preds = %.lr.ph54.split.us
  br label %48

; <label>:48:                                     ; preds = %.prol.preheader170
  %49 = load double, double* %44, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  br label %.prol.loopexit171.unr-lcssa

.prol.loopexit171.unr-lcssa:                      ; preds = %.lr.ph54.split.us, %48
  %.lcssa157.unr.ph = phi double [ %53, %48 ], [ undef, %.lr.ph54.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %48 ], [ 0, %.lr.ph54.split.us ]
  %.unr174.ph = phi double [ %53, %48 ], [ %47, %.lr.ph54.split.us ]
  br label %.prol.loopexit171

.prol.loopexit171:                                ; preds = %.prol.loopexit171.unr-lcssa
  br i1 %45, label %._crit_edge48.us, label %.lr.ph54.split.us.new

.lr.ph54.split.us.new:                            ; preds = %.prol.loopexit171
  br label %54

; <label>:54:                                     ; preds = %54, %.lr.ph54.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph54.split.us.new ], [ %indvars.iv.next124.1, %54 ]
  %55 = phi double [ %.unr174.ph, %.lr.ph54.split.us.new ], [ %69, %54 ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %57 = bitcast double* %56 to <2 x double>*
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %59 = load double, double* %58, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %60 = load <2 x double>, <2 x double>* %57, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %62 = load double, double* %61, align 8
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = fmul <2 x double> %60, %64
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fsub double %55, %66
  %69 = fsub double %68, %67
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %6
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge48.us.unr-lcssa, label %54

._crit_edge48.us.unr-lcssa:                       ; preds = %54
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit171, %._crit_edge48.us.unr-lcssa
  %.lcssa157 = phi double [ %.lcssa157.unr.ph, %.prol.loopexit171 ], [ %69, %._crit_edge48.us.unr-lcssa ]
  store double %.lcssa157, double* %46, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %70 = icmp slt i64 %indvars.iv.next136, 2000
  br i1 %70, label %.lr.ph54.split.us, label %._crit_edge55.loopexit

.lr.ph54.split:                                   ; preds = %.lr.ph54.split, %.lr.ph54.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph54.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph54.split ]
  %exitcond121.7 = icmp eq i64 %indvars.iv118, 1992
  %indvars.iv.next119.7 = add i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %._crit_edge55.loopexit151.unr-lcssa, label %.lr.ph54.split

._crit_edge55.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge55

._crit_edge55.loopexit151.unr-lcssa:              ; preds = %.lr.ph54.split
  br label %._crit_edge55.loopexit151

._crit_edge55.loopexit151:                        ; preds = %.lr.ph54.split.prol.loopexit, %._crit_edge55.loopexit151.unr-lcssa
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit151, %._crit_edge55.loopexit, %._crit_edge42
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %71 = icmp slt i64 %indvars.iv.next138, 2000
  %indvars.iv.next130 = add nuw nsw i64 %6, 1
  br i1 %71, label %._crit_edge, label %.lr.ph29.preheader

.lr.ph29.preheader:                               ; preds = %._crit_edge55
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %._crit_edge73
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge73 ], [ 0, %.lr.ph29.preheader ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge73 ], [ -1, %.lr.ph29.preheader ]
  %72 = add i64 %indvars.iv102, 4294967295
  %73 = and i64 %72, 4294967295
  %74 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = icmp sgt i64 %indvars.iv102, 0
  br i1 %77, label %.lr.ph24, label %._crit_edge73

.lr.ph24:                                         ; preds = %.lr.ph29
  %78 = bitcast i64 %76 to double
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter160 = and i64 %indvars.iv102, 3
  %lcmp.mod161 = icmp eq i64 %xtraiter160, 0
  br i1 %lcmp.mod161, label %.prol.loopexit159, label %.prol.preheader158

.prol.preheader158:                               ; preds = %.lr.ph24
  br label %79

; <label>:79:                                     ; preds = %79, %.prol.preheader158
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %79 ], [ 0, %.prol.preheader158 ]
  %80 = phi double [ %86, %79 ], [ %78, %.prol.preheader158 ]
  %prol.iter162 = phi i64 [ %prol.iter162.sub, %79 ], [ %xtraiter160, %.prol.preheader158 ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter162.sub = add i64 %prol.iter162, -1
  %prol.iter162.cmp = icmp eq i64 %prol.iter162.sub, 0
  br i1 %prol.iter162.cmp, label %.prol.loopexit159.unr-lcssa, label %79, !llvm.loop !13

.prol.loopexit159.unr-lcssa:                      ; preds = %79
  br label %.prol.loopexit159

.prol.loopexit159:                                ; preds = %.lr.ph24, %.prol.loopexit159.unr-lcssa
  %.lcssa155.unr = phi double [ undef, %.lr.ph24 ], [ %86, %.prol.loopexit159.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next93.prol, %.prol.loopexit159.unr-lcssa ]
  %.unr163 = phi double [ %78, %.lr.ph24 ], [ %86, %.prol.loopexit159.unr-lcssa ]
  %87 = icmp ult i64 %73, 3
  br i1 %87, label %._crit_edge25, label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.prol.loopexit159
  br label %88

; <label>:88:                                     ; preds = %88, %.lr.ph24.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph24.new ], [ %indvars.iv.next93.3, %88 ]
  %89 = phi double [ %.unr163, %.lr.ph24.new ], [ %111, %88 ]
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %91 = bitcast double* %90 to <2 x double>*
  %92 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %93 = bitcast double* %92 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %91, align 8
  %95 = load <2 x double>, <2 x double>* %93, align 8
  %96 = fmul <2 x double> %94, %95
  %97 = extractelement <2 x double> %96, i32 0
  %98 = extractelement <2 x double> %96, i32 1
  %99 = fsub double %89, %97
  %100 = fsub double %99, %98
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %104 = bitcast double* %103 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %100, %108
  %111 = fsub double %110, %109
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge25.unr-lcssa, label %88

._crit_edge25.unr-lcssa:                          ; preds = %88
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.prol.loopexit159, %._crit_edge25.unr-lcssa
  %.lcssa155 = phi double [ %.lcssa155.unr, %.prol.loopexit159 ], [ %111, %._crit_edge25.unr-lcssa ]
  %112 = bitcast double %.lcssa155 to i64
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %.lr.ph29, %._crit_edge25
  %113 = phi i64 [ %112, %._crit_edge25 ], [ %76, %.lr.ph29 ]
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %116 = icmp slt i64 %indvars.iv.next103, 2000
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %116, label %.lr.ph29, label %.lr.ph17.preheader

.lr.ph17.preheader:                               ; preds = %._crit_edge73
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %.lr.ph17.preheader, %._crit_edge79
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %indvar.next, %._crit_edge79 ]
  %indvars.iv89 = phi i64 [ 1999, %.lr.ph17.preheader ], [ %indvars.iv.next90, %._crit_edge79 ]
  %indvars.iv = phi i32 [ 2000, %.lr.ph17.preheader ], [ %indvars.iv.next, %._crit_edge79 ]
  %117 = sub i32 2000, %indvar
  %118 = sext i32 %117 to i64
  %119 = sub nsw i64 1999, %118
  %120 = getelementptr inbounds double, double* %4, i64 %indvars.iv89
  %121 = load double, double* %120, align 8
  %122 = add nsw i64 %indvars.iv89, 1
  %123 = icmp slt i64 %122, 2000
  br i1 %123, label %.lr.ph, label %._crit_edge77

.lr.ph:                                           ; preds = %.lr.ph17
  %124 = sext i32 %indvars.iv to i64
  %125 = sub nsw i64 0, %118
  %xtraiter = and i64 %125, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %126

; <label>:126:                                    ; preds = %126, %.prol.preheader
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %126 ], [ %124, %.prol.preheader ]
  %127 = phi double [ %133, %126 ], [ %121, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %126 ], [ %xtraiter, %.prol.preheader ]
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87.prol
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds double, double* %3, i64 %indvars.iv87.prol
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = fsub double %127, %132
  %indvars.iv.next88.prol = add nsw i64 %indvars.iv87.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %126, !llvm.loop !14

.prol.loopexit.unr-lcssa:                         ; preds = %126
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %133, %.prol.loopexit.unr-lcssa ]
  %indvars.iv87.unr = phi i64 [ %124, %.lr.ph ], [ %indvars.iv.next88.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %121, %.lr.ph ], [ %133, %.prol.loopexit.unr-lcssa ]
  %134 = icmp ult i64 %119, 3
  br i1 %134, label %._crit_edge77.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %135

; <label>:135:                                    ; preds = %135, %.lr.ph.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr, %.lr.ph.new ], [ %indvars.iv.next88.3, %135 ]
  %136 = phi double [ %.unr, %.lr.ph.new ], [ %158, %135 ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87
  %138 = bitcast double* %137 to <2 x double>*
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %140 = bitcast double* %139 to <2 x double>*
  %141 = load <2 x double>, <2 x double>* %138, align 8
  %142 = load <2 x double>, <2 x double>* %140, align 8
  %143 = fmul <2 x double> %141, %142
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fsub double %136, %144
  %147 = fsub double %146, %145
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %148 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv.next88.1
  %149 = bitcast double* %148 to <2 x double>*
  %150 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next88.1
  %151 = bitcast double* %150 to <2 x double>*
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %152 = load <2 x double>, <2 x double>* %149, align 8
  %153 = load <2 x double>, <2 x double>* %151, align 8
  %154 = fmul <2 x double> %152, %153
  %155 = extractelement <2 x double> %154, i32 0
  %156 = extractelement <2 x double> %154, i32 1
  %157 = fsub double %147, %155
  %158 = fsub double %157, %156
  %exitcond.3 = icmp eq i64 %indvars.iv.next88.2, 1999
  %indvars.iv.next88.3 = add nsw i64 %indvars.iv87, 4
  br i1 %exitcond.3, label %._crit_edge77.loopexit.unr-lcssa, label %135

._crit_edge77.loopexit.unr-lcssa:                 ; preds = %135
  br label %._crit_edge77.loopexit

._crit_edge77.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge77.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %158, %._crit_edge77.loopexit.unr-lcssa ]
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.lr.ph17
  %159 = phi double [ %121, %.lr.ph17 ], [ %.lcssa, %._crit_edge77.loopexit ]
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  %161 = load double, double* %160, align 8
  %162 = fdiv double %159, %161
  %163 = getelementptr inbounds double, double* %3, i64 %indvars.iv89
  store double %162, double* %163, align 8
  %164 = icmp sgt i64 %indvars.iv89, 0
  br i1 %164, label %._crit_edge79, label %._crit_edge76

._crit_edge79:                                    ; preds = %._crit_edge77
  %indvars.iv.next90 = add i64 %indvars.iv89, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.lr.ph17

._crit_edge76:                                    ; preds = %._crit_edge77
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %._crit_edge3
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge3, label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !2}
!14 = distinct !{!14, !2}
