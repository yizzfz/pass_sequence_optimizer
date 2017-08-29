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
  br i1 %10, label %.lr.ph64, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %5
  br label %._crit_edge._crit_edge

.lr.ph64:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter203 = and i64 %11, 1
  %lcmp.mod204 = icmp eq i64 %xtraiter203, 0
  br i1 %lcmp.mod204, label %._crit_edge77.prol.loopexit, label %._crit_edge77.prol.preheader

._crit_edge77.prol.preheader:                     ; preds = %.lr.ph64
  br label %._crit_edge77.prol

._crit_edge77.prol:                               ; preds = %._crit_edge77.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge77.prol.loopexit

._crit_edge77.prol.loopexit:                      ; preds = %.lr.ph64, %._crit_edge77.prol
  %indvars.iv123.unr = phi i64 [ 0, %.lr.ph64 ], [ 1, %._crit_edge77.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge, label %.lr.ph64.new

.lr.ph64.new:                                     ; preds = %._crit_edge77.prol.loopexit
  br label %._crit_edge77

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge77
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge77.prol.loopexit, %._crit_edge.unr-lcssa
  br i1 true, label %._crit_edge11.lr.ph, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

._crit_edge11.lr.ph:                              ; preds = %._crit_edge
  %16 = add i32 %0, -1
  %wide.trip.count = sext i32 %16 to i64
  %17 = add nsw i64 %wide.trip.count, -1
  br label %._crit_edge11

._crit_edge77:                                    ; preds = %._crit_edge77, %.lr.ph64.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr, %.lr.ph64.new ], [ %indvars.iv.next124.1, %._crit_edge77 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv123
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv123
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %22 = trunc i64 %indvars.iv.next124 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv123
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %25 = trunc i64 %indvars.iv.next124.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %9, i32 0
  %28 = insertelement <2 x double> %27, double %9, i32 1
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %26, i32 1
  %31 = fdiv <2 x double> %30, %28
  %32 = fmul <2 x double> %31, <double 5.000000e-01, double 5.000000e-01>
  %33 = fadd <2 x double> %32, <double 4.000000e+00, double 4.000000e+00>
  %34 = bitcast double* %24 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %35 = icmp slt i64 %indvars.iv.next124.1, %11
  br i1 %35, label %._crit_edge77, label %._crit_edge.unr-lcssa

._crit_edge11:                                    ; preds = %._crit_edge54, %._crit_edge11.lr.ph
  %indvar198 = phi i64 [ %indvar.next199, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %36 = phi i32 [ %storemerge1051, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %37 = sub i64 %wide.trip.count, %indvar198
  %38 = sub i64 %17, %indvar198
  %39 = icmp slt i32 %36, 0
  br i1 %39, label %._crit_edge11.._crit_edge48_crit_edge, label %.lr.ph47

._crit_edge11.._crit_edge48_crit_edge:            ; preds = %._crit_edge11
  %.pre190 = sext i32 %36 to i64
  br label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge11
  %40 = sext i32 %36 to i64
  %wide.trip.count119 = zext i32 %36 to i64
  br label %41

; <label>:41:                                     ; preds = %41, %.lr.ph47
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %41 ], [ 0, %.lr.ph47 ]
  %42 = sub nsw i64 0, %indvars.iv117
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %9
  %47 = fadd double %46, 1.000000e+00
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv117
  store double %47, double* %48, align 8
  %exitcond120 = icmp eq i64 %indvars.iv117, %wide.trip.count119
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br i1 %exitcond120, label %._crit_edge48.loopexit, label %41

._crit_edge48.loopexit:                           ; preds = %41
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge11.._crit_edge48_crit_edge, %._crit_edge48.loopexit
  %.pre-phi = phi i64 [ %.pre190, %._crit_edge11.._crit_edge48_crit_edge ], [ %40, %._crit_edge48.loopexit ]
  %storemerge1051 = add nsw i32 %36, 1
  %49 = icmp slt i32 %storemerge1051, %0
  br i1 %49, label %.lr.ph53, label %._crit_edge54

.lr.ph53:                                         ; preds = %._crit_edge48
  %50 = sext i32 %storemerge1051 to i64
  %xtraiter200 = and i64 %37, 7
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph53
  br label %51

; <label>:51:                                     ; preds = %51, %.prol.preheader
  %indvars.iv121.prol = phi i64 [ %indvars.iv.next122.prol, %51 ], [ %50, %.prol.preheader ]
  %prol.iter202 = phi i64 [ %prol.iter202.sub, %51 ], [ %xtraiter200, %.prol.preheader ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv121.prol
  store double 0.000000e+00, double* %52, align 8
  %indvars.iv.next122.prol = add nsw i64 %indvars.iv121.prol, 1
  %prol.iter202.sub = add i64 %prol.iter202, -1
  %prol.iter202.cmp = icmp eq i64 %prol.iter202.sub, 0
  br i1 %prol.iter202.cmp, label %.prol.loopexit.unr-lcssa, label %51, !llvm.loop !1

.prol.loopexit.unr-lcssa:                         ; preds = %51
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph53, %.prol.loopexit.unr-lcssa
  %indvars.iv121.unr = phi i64 [ %50, %.lr.ph53 ], [ %indvars.iv.next122.prol, %.prol.loopexit.unr-lcssa ]
  %53 = icmp ult i64 %38, 7
  br i1 %53, label %._crit_edge54.loopexit, label %.lr.ph53.new

.lr.ph53.new:                                     ; preds = %.prol.loopexit
  br label %54

; <label>:54:                                     ; preds = %54, %.lr.ph53.new
  %indvars.iv121 = phi i64 [ %indvars.iv121.unr, %.lr.ph53.new ], [ %indvars.iv.next122.7, %54 ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv121
  store double 0.000000e+00, double* %55, align 8
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122
  store double 0.000000e+00, double* %56, align 8
  %indvars.iv.next122.1 = add nsw i64 %indvars.iv121, 2
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.1
  store double 0.000000e+00, double* %57, align 8
  %indvars.iv.next122.2 = add nsw i64 %indvars.iv121, 3
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.2
  store double 0.000000e+00, double* %58, align 8
  %indvars.iv.next122.3 = add nsw i64 %indvars.iv121, 4
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.3
  store double 0.000000e+00, double* %59, align 8
  %indvars.iv.next122.4 = add nsw i64 %indvars.iv121, 5
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.4
  store double 0.000000e+00, double* %60, align 8
  %indvars.iv.next122.5 = add nsw i64 %indvars.iv121, 6
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.5
  store double 0.000000e+00, double* %61, align 8
  %indvars.iv.next122.6 = add nsw i64 %indvars.iv121, 7
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv.next122.6
  store double 0.000000e+00, double* %62, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next122.6, %wide.trip.count
  %indvars.iv.next122.7 = add nsw i64 %indvars.iv121, 8
  br i1 %exitcond.7, label %._crit_edge54.loopexit.unr-lcssa, label %54

._crit_edge54.loopexit.unr-lcssa:                 ; preds = %54
  br label %._crit_edge54.loopexit

._crit_edge54.loopexit:                           ; preds = %.prol.loopexit, %._crit_edge54.loopexit.unr-lcssa
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %._crit_edge48
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %.pre-phi
  store double 1.000000e+00, double* %63, align 8
  %indvar.next199 = add i64 %indvar198, 1
  br i1 %49, label %._crit_edge11, label %._crit_edge58

._crit_edge58:                                    ; preds = %._crit_edge54
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %._crit_edge.thread, %._crit_edge58
  %64 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %65 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %64, i8** %65, align 8
  %66 = bitcast i8* %64 to [2000 x [2000 x double]]*
  br i1 %10, label %._crit_edge12.lr.ph, label %._crit_edge13.thread

._crit_edge13.thread:                             ; preds = %._crit_edge._crit_edge
  br label %._crit_edge15

._crit_edge12.lr.ph:                              ; preds = %._crit_edge._crit_edge
  %67 = sext i32 %0 to i64
  br i1 true, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge, label %._crit_edge12..._crit_edge13_crit_edge_crit_edge

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge:   ; preds = %._crit_edge12.lr.ph
  %68 = add i32 %0, -1
  %69 = zext i32 %68 to i64
  %70 = shl nuw nsw i64 %69, 3
  %71 = add nuw nsw i64 %70, 8
  %72 = add nsw i64 %67, -1
  %xtraiter195 = and i64 %67, 3
  %lcmp.mod196 = icmp eq i64 %xtraiter195, 0
  br i1 %lcmp.mod196, label %._crit_edge40.us.prol.loopexit, label %._crit_edge40.us.prol.preheader

._crit_edge40.us.prol.preheader:                  ; preds = %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge
  br label %._crit_edge40.us.prol

._crit_edge40.us.prol:                            ; preds = %._crit_edge40.us.prol, %._crit_edge40.us.prol.preheader
  %indvars.iv114.prol = phi i64 [ %indvars.iv.next115.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %prol.iter197 = phi i64 [ %prol.iter197.sub, %._crit_edge40.us.prol ], [ %xtraiter195, %._crit_edge40.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvar.prol, i64 0
  %scevgep113.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.prol, i8 0, i64 %71, i32 8, i1 false)
  %indvars.iv.next115.prol = add i64 %indvars.iv114.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter197.sub = add i64 %prol.iter197, -1
  %prol.iter197.cmp = icmp eq i64 %prol.iter197.sub, 0
  br i1 %prol.iter197.cmp, label %._crit_edge40.us.prol.loopexit.unr-lcssa, label %._crit_edge40.us.prol, !llvm.loop !3

._crit_edge40.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge40.us.prol
  br label %._crit_edge40.us.prol.loopexit

._crit_edge40.us.prol.loopexit:                   ; preds = %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge, %._crit_edge40.us.prol.loopexit.unr-lcssa
  %indvars.iv114.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvars.iv.next115.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvar.next.prol, %._crit_edge40.us.prol.loopexit.unr-lcssa ]
  %73 = icmp ult i64 %72, 3
  br i1 %73, label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new: ; preds = %._crit_edge40.us.prol.loopexit
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvars.iv.next115.3, %._crit_edge40.us ]
  %indvar = phi i64 [ %indvar.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge40.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvar, i64 0
  %scevgep113 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113, i8 0, i64 %71, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvar.next, i64 0
  %scevgep113.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.1, i8 0, i64 %71, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvar.next.1, i64 0
  %scevgep113.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.2, i8 0, i64 %71, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvar.next.2, i64 0
  %scevgep113.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.3, i8 0, i64 %71, i32 8, i1 false)
  %indvars.iv.next115.3 = add i64 %indvars.iv114, 4
  %74 = icmp slt i64 %indvars.iv.next115.3, %67
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %74, label %._crit_edge40.us, label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa

._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa: ; preds = %._crit_edge40.us
  br label %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge

._crit_edge40.us..._crit_edge13_crit_edge_crit_edge: ; preds = %._crit_edge40.us.prol.loopexit, %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge.unr-lcssa
  %.pr131.pre = load i32, i32* %6, align 4
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge, %._crit_edge12..._crit_edge13_crit_edge_crit_edge
  %75 = phi i32 [ %.pr131.pre, %._crit_edge40.us..._crit_edge13_crit_edge_crit_edge ], [ %0, %._crit_edge12..._crit_edge13_crit_edge_crit_edge ]
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %._crit_edge14.lr.ph, label %._crit_edge15.thread

._crit_edge15.thread:                             ; preds = %._crit_edge13
  %.pre = load i8*, i8** %65, align 8
  br label %._crit_edge15._crit_edge

._crit_edge14.lr.ph:                              ; preds = %._crit_edge13
  %77 = sext i32 %75 to i64
  %78 = load [2000 x double]*, [2000 x double]** %7, align 8
  %79 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %80 = bitcast [2000 x [2000 x double]]* %79 to i8*
  br i1 true, label %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge, label %._crit_edge14..._crit_edge15_crit_edge_crit_edge

._crit_edge14.lr.ph.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge14.lr.ph
  %81 = add i32 %75, -1
  %wide.trip.count104 = zext i32 %81 to i64
  %82 = add nuw nsw i64 %wide.trip.count104, 1
  %83 = add nuw nsw i64 %wide.trip.count104, 1
  %min.iters.check = icmp ult i64 %82, 4
  %n.vec = and i64 %82, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %82, %n.vec
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge29.us, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge
  %indvar140 = phi i64 [ %84, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %78, i64 0, i64 %indvar140
  %84 = add i64 %indvar140, 1
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %78, i64 %wide.trip.count104, i64 %84
  br i1 true, label %._crit_edge16.us.us.preheader, label %._crit_edge14.us.._crit_edge29.us_crit_edge

._crit_edge14.us.._crit_edge29.us_crit_edge:      ; preds = %._crit_edge14.us
  br label %._crit_edge29.us

._crit_edge16.us.us.preheader:                    ; preds = %._crit_edge14.us
  br label %._crit_edge16.us.us

._crit_edge29.us:                                 ; preds = %._crit_edge14.us.._crit_edge29.us_crit_edge, %._crit_edge27.us.us.._crit_edge29.us_crit_edge
  %indvars.iv.next109 = add i64 %indvars.iv108, 1
  %85 = icmp slt i64 %indvars.iv.next109, %77
  br i1 %85, label %._crit_edge14.us, label %._crit_edge29.us..._crit_edge15_crit_edge_crit_edge

._crit_edge29.us..._crit_edge15_crit_edge_crit_edge: ; preds = %._crit_edge29.us
  br label %.._crit_edge15_crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.preheader, %._crit_edge27.us.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge27.us.us ], [ 0, %._crit_edge16.us.us.preheader ]
  %scevgep136 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 0
  %scevgep138 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 %82
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv106, i64 %indvars.iv108
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge16.us.us
  %indvars.iv102.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge16.us.us ], [ %n.vec, %middle.block ]
  %87 = sub nsw i64 %83, %indvars.iv102.ph
  %xtraiter193 = and i64 %87, 1
  %lcmp.mod194 = icmp eq i64 %xtraiter193, 0
  br i1 %lcmp.mod194, label %scalar.ph.prol.loopexit.unr-lcssa, label %scalar.ph.prol.preheader

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  %88 = load double, double* %86, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv102.ph, i64 %indvars.iv108
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 %indvars.iv102.ph
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  store double %94, double* %92, align 8
  %indvars.iv.next103.prol = or i64 %indvars.iv102.ph, 1
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  %indvars.iv102.unr.ph = phi i64 [ %indvars.iv.next103.prol, %scalar.ph.prol ], [ %indvars.iv102.ph, %scalar.ph.preheader ]
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  %95 = icmp eq i64 %wide.trip.count104, %indvars.iv102.ph
  br i1 %95, label %._crit_edge27.us.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %._crit_edge16.us.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep136, %scevgep144
  %bound1 = icmp ult double* %scevgep142, %scevgep138
  %found.conflict = and i1 %bound0, %bound1
  %bound0147 = icmp ult double* %scevgep136, %86
  %bound1148 = icmp ult double* %86, %scevgep138
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %96 = or i64 %index, 1
  %97 = or i64 %index, 2
  %98 = or i64 %index, 3
  %99 = load double, double* %86, align 8, !alias.scope !4
  %100 = insertelement <2 x double> undef, double %99, i32 0
  %101 = shufflevector <2 x double> %100, <2 x double> undef, <2 x i32> zeroinitializer
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %index, i64 %indvars.iv108
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %96, i64 %indvars.iv108
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %97, i64 %indvars.iv108
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %98, i64 %indvars.iv108
  %106 = load double, double* %102, align 8, !alias.scope !7
  %107 = load double, double* %103, align 8, !alias.scope !7
  %108 = load double, double* %104, align 8, !alias.scope !7
  %109 = load double, double* %105, align 8, !alias.scope !7
  %110 = insertelement <2 x double> undef, double %106, i32 0
  %111 = insertelement <2 x double> %110, double %107, i32 1
  %112 = insertelement <2 x double> undef, double %108, i32 0
  %113 = insertelement <2 x double> %112, double %109, i32 1
  %114 = fmul <2 x double> %101, %111
  %115 = fmul <2 x double> %101, %113
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 %index
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !9, !noalias !11
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !9, !noalias !11
  %120 = fadd <2 x double> %114, %wide.load
  %121 = fadd <2 x double> %115, %wide.load151
  store <2 x double> %120, <2 x double>* %117, align 8, !alias.scope !9, !noalias !11
  store <2 x double> %121, <2 x double>* %119, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %122 = icmp eq i64 %index.next, %n.vec
  br i1 %122, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge27.us.us, label %scalar.ph.preheader

._crit_edge27.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph
  br label %._crit_edge27.us.us.loopexit

._crit_edge27.us.us.loopexit:                     ; preds = %scalar.ph.prol.loopexit, %._crit_edge27.us.us.loopexit.unr-lcssa
  br label %._crit_edge27.us.us

._crit_edge27.us.us:                              ; preds = %._crit_edge27.us.us.loopexit, %middle.block
  %indvars.iv.next107 = add nuw i64 %indvars.iv106, 1
  %123 = icmp slt i64 %indvars.iv.next107, %77
  br i1 %123, label %._crit_edge16.us.us, label %._crit_edge27.us.us.._crit_edge29.us_crit_edge

._crit_edge27.us.us.._crit_edge29.us_crit_edge:   ; preds = %._crit_edge27.us.us
  br label %._crit_edge29.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next103.1, %scalar.ph ]
  %124 = load double, double* %86, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv102, i64 %indvars.iv108
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 %indvars.iv102
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  store double %130, double* %128, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %131 = load double, double* %86, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %78, i64 %indvars.iv.next103, i64 %indvars.iv108
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next103
  %136 = load double, double* %135, align 8
  %137 = fadd double %134, %136
  store double %137, double* %135, align 8
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  br i1 %exitcond105.1, label %._crit_edge27.us.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !15

._crit_edge12..._crit_edge13_crit_edge_crit_edge: ; preds = %._crit_edge12.lr.ph
  br label %._crit_edge13

.._crit_edge15_crit_edge:                         ; preds = %._crit_edge14..._crit_edge15_crit_edge_crit_edge, %._crit_edge29.us..._crit_edge15_crit_edge_crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge13.thread, %.._crit_edge15_crit_edge
  %138 = phi i8* [ %64, %._crit_edge13.thread ], [ %80, %.._crit_edge15_crit_edge ]
  %139 = phi [2000 x double]* [ %1, %._crit_edge13.thread ], [ %78, %.._crit_edge15_crit_edge ]
  %140 = phi [2000 x [2000 x double]]* [ %66, %._crit_edge13.thread ], [ %79, %.._crit_edge15_crit_edge ]
  %141 = phi i32 [ %0, %._crit_edge13.thread ], [ %75, %.._crit_edge15_crit_edge ]
  %142 = icmp sgt i32 %141, 0
  br i1 %142, label %._crit_edge17.lr.ph, label %._crit_edge15._crit_edge

._crit_edge17.lr.ph:                              ; preds = %._crit_edge15
  %143 = sext i32 %141 to i64
  br i1 true, label %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge, label %._crit_edge17.._crit_edge21_crit_edge

._crit_edge17.lr.ph.._crit_edge17.us_crit_edge:   ; preds = %._crit_edge17.lr.ph
  %144 = add i32 %141, -1
  %wide.trip.count98 = zext i32 %144 to i64
  %145 = add nuw nsw i64 %wide.trip.count98, 1
  %146 = and i64 %145, 8589934588
  %147 = add nsw i64 %146, -4
  %148 = lshr exact i64 %147, 2
  %149 = add nuw nsw i64 %wide.trip.count98, 1
  %min.iters.check155 = icmp ult i64 %145, 4
  %n.vec158 = and i64 %145, 8589934588
  %cmp.zero159 = icmp eq i64 %n.vec158, 0
  %150 = and i64 %148, 1
  %lcmp.mod = icmp eq i64 %150, 0
  %151 = icmp eq i64 %148, 0
  %cmp.n180 = icmp eq i64 %145, %n.vec158
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge19.us, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge
  %indvar161 = phi i64 [ %indvar.next162, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %139, i64 %indvar161, i64 0
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %139, i64 %indvar161, i64 %145
  %scevgep167 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvar161, i64 0
  %scevgep169 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvar161, i64 %145
  br i1 %min.iters.check155, label %scalar.ph154.preheader, label %min.iters.checked156

min.iters.checked156:                             ; preds = %._crit_edge17.us
  br i1 %cmp.zero159, label %scalar.ph154.preheader, label %vector.memcheck175

vector.memcheck175:                               ; preds = %min.iters.checked156
  %bound0171 = icmp ult double* %scevgep163, %scevgep169
  %bound1172 = icmp ult double* %scevgep167, %scevgep165
  %memcheck.conflict174 = and i1 %bound0171, %bound1172
  br i1 %memcheck.conflict174, label %scalar.ph154.preheader, label %vector.body152.preheader

vector.body152.preheader:                         ; preds = %vector.memcheck175
  br i1 %lcmp.mod, label %vector.body152.prol.preheader, label %vector.body152.prol.loopexit.unr-lcssa

vector.body152.prol.preheader:                    ; preds = %vector.body152.preheader
  br label %vector.body152.prol

vector.body152.prol:                              ; preds = %vector.body152.prol.preheader
  %152 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 0
  %153 = bitcast double* %152 to <2 x i64>*
  %wide.load185.prol = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !16
  %154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 2
  %155 = bitcast double* %154 to <2 x i64>*
  %wide.load186.prol = load <2 x i64>, <2 x i64>* %155, align 8, !alias.scope !16
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 0
  %157 = bitcast double* %156 to <2 x i64>*
  store <2 x i64> %wide.load185.prol, <2 x i64>* %157, align 8, !alias.scope !19, !noalias !16
  %158 = getelementptr [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 2
  %159 = bitcast double* %158 to <2 x i64>*
  store <2 x i64> %wide.load186.prol, <2 x i64>* %159, align 8, !alias.scope !19, !noalias !16
  br label %vector.body152.prol.loopexit.unr-lcssa

vector.body152.prol.loopexit.unr-lcssa:           ; preds = %vector.body152.preheader, %vector.body152.prol
  %index177.unr.ph = phi i64 [ 4, %vector.body152.prol ], [ 0, %vector.body152.preheader ]
  br label %vector.body152.prol.loopexit

vector.body152.prol.loopexit:                     ; preds = %vector.body152.prol.loopexit.unr-lcssa
  br i1 %151, label %middle.block153, label %vector.body152.preheader.new

vector.body152.preheader.new:                     ; preds = %vector.body152.prol.loopexit
  br label %vector.body152

vector.body152:                                   ; preds = %vector.body152, %vector.body152.preheader.new
  %index177 = phi i64 [ %index177.unr.ph, %vector.body152.preheader.new ], [ %index.next178.1, %vector.body152 ]
  %160 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %index177
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load185 = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !16
  %162 = getelementptr double, double* %160, i64 2
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load186 = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !16
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %index177
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load185, <2 x i64>* %165, align 8, !alias.scope !19, !noalias !16
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load186, <2 x i64>* %167, align 8, !alias.scope !19, !noalias !16
  %index.next178 = add i64 %index177, 4
  %168 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %index.next178
  %169 = bitcast double* %168 to <2 x i64>*
  %wide.load185.1 = load <2 x i64>, <2 x i64>* %169, align 8, !alias.scope !16
  %170 = getelementptr double, double* %168, i64 2
  %171 = bitcast double* %170 to <2 x i64>*
  %wide.load186.1 = load <2 x i64>, <2 x i64>* %171, align 8, !alias.scope !16
  %172 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %index.next178
  %173 = bitcast double* %172 to <2 x i64>*
  store <2 x i64> %wide.load185.1, <2 x i64>* %173, align 8, !alias.scope !19, !noalias !16
  %174 = getelementptr double, double* %172, i64 2
  %175 = bitcast double* %174 to <2 x i64>*
  store <2 x i64> %wide.load186.1, <2 x i64>* %175, align 8, !alias.scope !19, !noalias !16
  %index.next178.1 = add i64 %index177, 8
  %176 = icmp eq i64 %index.next178.1, %n.vec158
  br i1 %176, label %middle.block153.unr-lcssa, label %vector.body152, !llvm.loop !21

middle.block153.unr-lcssa:                        ; preds = %vector.body152
  br label %middle.block153

middle.block153:                                  ; preds = %vector.body152.prol.loopexit, %middle.block153.unr-lcssa
  br i1 %cmp.n180, label %._crit_edge19.us, label %scalar.ph154.preheader

scalar.ph154.preheader:                           ; preds = %middle.block153, %vector.memcheck175, %min.iters.checked156, %._crit_edge17.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck175 ], [ 0, %min.iters.checked156 ], [ 0, %._crit_edge17.us ], [ %n.vec158, %middle.block153 ]
  %177 = sub nsw i64 %149, %indvars.iv.ph
  %178 = sub nsw i64 %wide.trip.count98, %indvars.iv.ph
  %xtraiter191 = and i64 %177, 3
  %lcmp.mod192 = icmp eq i64 %xtraiter191, 0
  br i1 %lcmp.mod192, label %scalar.ph154.prol.loopexit, label %scalar.ph154.prol.preheader

scalar.ph154.prol.preheader:                      ; preds = %scalar.ph154.preheader
  br label %scalar.ph154.prol

scalar.ph154.prol:                                ; preds = %scalar.ph154.prol, %scalar.ph154.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph154.prol ], [ %indvars.iv.ph, %scalar.ph154.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph154.prol ], [ %xtraiter191, %scalar.ph154.prol.preheader ]
  %179 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %indvars.iv.prol
  %180 = bitcast double* %179 to i64*
  %181 = load i64, i64* %180, align 8
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %indvars.iv.prol
  %183 = bitcast double* %182 to i64*
  store i64 %181, i64* %183, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph154.prol.loopexit.unr-lcssa, label %scalar.ph154.prol, !llvm.loop !22

scalar.ph154.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph154.prol
  br label %scalar.ph154.prol.loopexit

scalar.ph154.prol.loopexit:                       ; preds = %scalar.ph154.preheader, %scalar.ph154.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph154.preheader ], [ %indvars.iv.next.prol, %scalar.ph154.prol.loopexit.unr-lcssa ]
  %184 = icmp ult i64 %178, 3
  br i1 %184, label %._crit_edge19.us.loopexit, label %scalar.ph154.preheader.new

scalar.ph154.preheader.new:                       ; preds = %scalar.ph154.prol.loopexit
  br label %scalar.ph154

scalar.ph154:                                     ; preds = %scalar.ph154, %scalar.ph154.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph154.preheader.new ], [ %indvars.iv.next.3, %scalar.ph154 ]
  %185 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %indvars.iv
  %186 = bitcast double* %185 to i64*
  %187 = load i64, i64* %186, align 8
  %188 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %indvars.iv
  %189 = bitcast double* %188 to i64*
  store i64 %187, i64* %189, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %190 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next
  %191 = bitcast double* %190 to i64*
  %192 = load i64, i64* %191, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %indvars.iv.next
  %194 = bitcast double* %193 to i64*
  store i64 %192, i64* %194, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %195 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %196 = bitcast double* %195 to i64*
  %197 = load i64, i64* %196, align 8
  %198 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %199 = bitcast double* %198 to i64*
  store i64 %197, i64* %199, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %200 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %140, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %201 = bitcast double* %200 to i64*
  %202 = load i64, i64* %201, align 8
  %203 = getelementptr inbounds [2000 x double], [2000 x double]* %139, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %204 = bitcast double* %203 to i64*
  store i64 %202, i64* %204, align 8
  %exitcond99.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count98
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond99.3, label %._crit_edge19.us.loopexit.unr-lcssa, label %scalar.ph154, !llvm.loop !23

._crit_edge19.us.loopexit.unr-lcssa:              ; preds = %scalar.ph154
  br label %._crit_edge19.us.loopexit

._crit_edge19.us.loopexit:                        ; preds = %scalar.ph154.prol.loopexit, %._crit_edge19.us.loopexit.unr-lcssa
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %middle.block153
  %indvars.iv.next101 = add i64 %indvars.iv100, 1
  %205 = icmp slt i64 %indvars.iv.next101, %143
  %indvar.next162 = add i64 %indvar161, 1
  br i1 %205, label %._crit_edge17.us, label %._crit_edge19.us.._crit_edge21_crit_edge

._crit_edge19.us.._crit_edge21_crit_edge:         ; preds = %._crit_edge19.us
  br label %._crit_edge21

._crit_edge14..._crit_edge15_crit_edge_crit_edge: ; preds = %._crit_edge14.lr.ph
  br label %.._crit_edge15_crit_edge

._crit_edge17.._crit_edge21_crit_edge:            ; preds = %._crit_edge17.lr.ph
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge17.._crit_edge21_crit_edge, %._crit_edge19.us.._crit_edge21_crit_edge
  br label %._crit_edge15._crit_edge

._crit_edge15._crit_edge:                         ; preds = %._crit_edge15, %._crit_edge15.thread, %._crit_edge21
  %206 = phi i8* [ %138, %._crit_edge15 ], [ %.pre, %._crit_edge15.thread ], [ %138, %._crit_edge21 ]
  call void @free(i8* %206) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %._crit_edge9

._crit_edge.lr.ph:                                ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count120 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count120, 1
  br label %._crit_edge

.._crit_edge9_crit_edge:                          ; preds = %._crit_edge55
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %5, %.._crit_edge9_crit_edge
  br i1 %6, label %.lr.ph29, label %._crit_edge9._crit_edge.thread

._crit_edge9._crit_edge.thread:                   ; preds = %._crit_edge9
  br label %._crit_edge76

.lr.ph29:                                         ; preds = %._crit_edge9
  %10 = sext i32 %0 to i64
  br label %84

._crit_edge:                                      ; preds = %._crit_edge55, %._crit_edge.lr.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge55 ], [ 0, %._crit_edge.lr.ph ]
  %indvars.iv129 = phi i32 [ %15, %._crit_edge55 ], [ -1, %._crit_edge.lr.ph ]
  %11 = add i64 %indvars.iv137, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = sub i64 %9, %indvars.iv137
  %14 = sub i64 %wide.trip.count120, %indvars.iv137
  %15 = add i32 %indvars.iv129, 1
  %16 = icmp sgt i64 %indvars.iv137, 0
  br i1 %16, label %.lr.ph41.preheader, label %._crit_edge42

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge69
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge69 ], [ 0, %.lr.ph41.preheader ]
  %indvars.iv110 = phi i32 [ %20, %._crit_edge69 ], [ -1, %.lr.ph41.preheader ]
  %18 = add i64 %indvars.iv114, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = add i32 %indvars.iv110, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %22 = load double, double* %21, align 8
  %23 = icmp sgt i64 %indvars.iv114, 0
  br i1 %23, label %.lr.ph36, label %._crit_edge69

.lr.ph36:                                         ; preds = %.lr.ph41
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %24 = and i64 %18, 1
  %lcmp.mod171 = icmp eq i64 %24, 0
  br i1 %lcmp.mod171, label %.prol.preheader168, label %.prol.loopexit169.unr-lcssa

.prol.preheader168:                               ; preds = %.lr.ph36
  br label %25

; <label>:25:                                     ; preds = %.prol.preheader168
  %26 = load double, double* %17, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %22, %29
  br label %.prol.loopexit169.unr-lcssa

.prol.loopexit169.unr-lcssa:                      ; preds = %.lr.ph36, %25
  %.lcssa159.unr.ph = phi double [ %30, %25 ], [ undef, %.lr.ph36 ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %25 ], [ 0, %.lr.ph36 ]
  %.unr172.ph = phi double [ %30, %25 ], [ %22, %.lr.ph36 ]
  br label %.prol.loopexit169

.prol.loopexit169:                                ; preds = %.prol.loopexit169.unr-lcssa
  %31 = icmp eq i64 %19, 0
  br i1 %31, label %._crit_edge37, label %.lr.ph36.new

.lr.ph36.new:                                     ; preds = %.prol.loopexit169
  br label %32

; <label>:32:                                     ; preds = %32, %.lr.ph36.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph36.new ], [ %indvars.iv.next105.1, %32 ]
  %33 = phi double [ %.unr172.ph, %.lr.ph36.new ], [ %47, %32 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %35 = bitcast double* %34 to <2 x double>*
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %37 = load double, double* %36, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %38 = load <2 x double>, <2 x double>* %35, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %40 = load double, double* %39, align 8
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %38, %42
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %46 = fsub double %33, %44
  %47 = fsub double %46, %45
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %wide.trip.count112
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge37.unr-lcssa, label %32

._crit_edge37.unr-lcssa:                          ; preds = %32
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %.prol.loopexit169, %._crit_edge37.unr-lcssa
  %.lcssa159 = phi double [ %.lcssa159.unr.ph, %.prol.loopexit169 ], [ %47, %._crit_edge37.unr-lcssa ]
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %.lr.ph41, %._crit_edge37
  %48 = phi double [ %.lcssa159, %._crit_edge37 ], [ %22, %.lr.ph41 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %21, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %52 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %52, label %.lr.ph41, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge69
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %._crit_edge
  %53 = icmp slt i64 %indvars.iv137, %8
  br i1 %53, label %.lr.ph54, label %._crit_edge55

.lr.ph54:                                         ; preds = %._crit_edge42
  br i1 %16, label %.lr.ph54.split.us.preheader, label %.lr.ph54.split.preheader

.lr.ph54.split.preheader:                         ; preds = %.lr.ph54
  %xtraiter173 = and i64 %13, 3
  %lcmp.mod174 = icmp eq i64 %xtraiter173, 0
  br i1 %lcmp.mod174, label %.lr.ph54.split.prol.loopexit, label %.lr.ph54.split.prol.preheader

.lr.ph54.split.prol.preheader:                    ; preds = %.lr.ph54.split.preheader
  br label %.lr.ph54.split.prol

.lr.ph54.split.prol:                              ; preds = %.lr.ph54.split.prol, %.lr.ph54.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph54.split.prol ], [ %indvars.iv137, %.lr.ph54.split.prol.preheader ]
  %prol.iter175 = phi i64 [ %prol.iter175.sub, %.lr.ph54.split.prol ], [ %xtraiter173, %.lr.ph54.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter175.sub = add i64 %prol.iter175, -1
  %prol.iter175.cmp = icmp eq i64 %prol.iter175.sub, 0
  br i1 %prol.iter175.cmp, label %.lr.ph54.split.prol.loopexit.unr-lcssa, label %.lr.ph54.split.prol, !llvm.loop !24

.lr.ph54.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph54.split.prol
  br label %.lr.ph54.split.prol.loopexit

.lr.ph54.split.prol.loopexit:                     ; preds = %.lr.ph54.split.preheader, %.lr.ph54.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph54.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph54.split.prol.loopexit.unr-lcssa ]
  %54 = icmp ult i64 %14, 3
  br i1 %54, label %._crit_edge55.loopexit140, label %.lr.ph54.split.preheader.new

.lr.ph54.split.preheader.new:                     ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph54.split

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %55 = and i64 %11, 1
  %lcmp.mod179 = icmp eq i64 %55, 0
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %57 = icmp eq i64 %12, 0
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge48.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge48.us ], [ %indvars.iv137, %.lr.ph54.split.us.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %59 = load double, double* %58, align 8
  br i1 %lcmp.mod179, label %.prol.preheader176, label %.prol.loopexit177.unr-lcssa

.prol.preheader176:                               ; preds = %.lr.ph54.split.us
  br label %60

; <label>:60:                                     ; preds = %.prol.preheader176
  %61 = load double, double* %56, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  br label %.prol.loopexit177.unr-lcssa

.prol.loopexit177.unr-lcssa:                      ; preds = %.lr.ph54.split.us, %60
  %.lcssa161.unr.ph = phi double [ %65, %60 ], [ undef, %.lr.ph54.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %60 ], [ 0, %.lr.ph54.split.us ]
  %.unr180.ph = phi double [ %65, %60 ], [ %59, %.lr.ph54.split.us ]
  br label %.prol.loopexit177

.prol.loopexit177:                                ; preds = %.prol.loopexit177.unr-lcssa
  br i1 %57, label %._crit_edge48.us, label %.lr.ph54.split.us.new

.lr.ph54.split.us.new:                            ; preds = %.prol.loopexit177
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph54.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph54.split.us.new ], [ %indvars.iv.next124.1, %66 ]
  %67 = phi double [ %.unr180.ph, %.lr.ph54.split.us.new ], [ %81, %66 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %71 = load double, double* %70, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %67, %78
  %81 = fsub double %80, %79
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge48.us.unr-lcssa, label %66

._crit_edge48.us.unr-lcssa:                       ; preds = %66
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit177, %._crit_edge48.us.unr-lcssa
  %.lcssa161 = phi double [ %.lcssa161.unr.ph, %.prol.loopexit177 ], [ %81, %._crit_edge48.us.unr-lcssa ]
  store double %.lcssa161, double* %58, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %82 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %82, label %.lr.ph54.split.us, label %._crit_edge55.loopexit

.lr.ph54.split:                                   ; preds = %.lr.ph54.split, %.lr.ph54.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph54.split.preheader.new ], [ %indvars.iv.next119.3, %.lr.ph54.split ]
  %indvars.iv.next119.2 = add i64 %indvars.iv118, 3
  %exitcond121.3 = icmp eq i64 %indvars.iv.next119.2, %wide.trip.count120
  %indvars.iv.next119.3 = add i64 %indvars.iv118, 4
  br i1 %exitcond121.3, label %._crit_edge55.loopexit140.unr-lcssa, label %.lr.ph54.split

._crit_edge55.loopexit140.unr-lcssa:              ; preds = %.lr.ph54.split
  br label %._crit_edge55.loopexit140

._crit_edge55.loopexit140:                        ; preds = %.lr.ph54.split.prol.loopexit, %._crit_edge55.loopexit140.unr-lcssa
  br label %._crit_edge55

._crit_edge55.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %._crit_edge55.loopexit140, %._crit_edge42
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %83 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %83, label %._crit_edge, label %.._crit_edge9_crit_edge

; <label>:84:                                     ; preds = %._crit_edge73, %.lr.ph29
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge73 ], [ 0, %.lr.ph29 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge73 ], [ -1, %.lr.ph29 ]
  %85 = add i64 %indvars.iv102, 4294967295
  %86 = and i64 %85, 4294967295
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = icmp sgt i64 %indvars.iv102, 0
  %91 = bitcast i64 %89 to double
  br i1 %90, label %.lr.ph24, label %._crit_edge73

.lr.ph24:                                         ; preds = %84
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter164 = and i64 %indvars.iv102, 3
  %lcmp.mod165 = icmp eq i64 %xtraiter164, 0
  br i1 %lcmp.mod165, label %.prol.loopexit163, label %.prol.preheader162

.prol.preheader162:                               ; preds = %.lr.ph24
  br label %92

; <label>:92:                                     ; preds = %92, %.prol.preheader162
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %92 ], [ 0, %.prol.preheader162 ]
  %93 = phi double [ %99, %92 ], [ %91, %.prol.preheader162 ]
  %prol.iter166 = phi i64 [ %prol.iter166.sub, %92 ], [ %xtraiter164, %.prol.preheader162 ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %93, %98
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter166.sub = add i64 %prol.iter166, -1
  %prol.iter166.cmp = icmp eq i64 %prol.iter166.sub, 0
  br i1 %prol.iter166.cmp, label %.prol.loopexit163.unr-lcssa, label %92, !llvm.loop !25

.prol.loopexit163.unr-lcssa:                      ; preds = %92
  br label %.prol.loopexit163

.prol.loopexit163:                                ; preds = %.lr.ph24, %.prol.loopexit163.unr-lcssa
  %.lcssa157.unr = phi double [ undef, %.lr.ph24 ], [ %99, %.prol.loopexit163.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next93.prol, %.prol.loopexit163.unr-lcssa ]
  %.unr167 = phi double [ %91, %.lr.ph24 ], [ %99, %.prol.loopexit163.unr-lcssa ]
  %100 = icmp ult i64 %86, 3
  br i1 %100, label %._crit_edge25, label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.prol.loopexit163
  br label %101

; <label>:101:                                    ; preds = %101, %.lr.ph24.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph24.new ], [ %indvars.iv.next93.3, %101 ]
  %102 = phi double [ %.unr167, %.lr.ph24.new ], [ %124, %101 ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %104 = bitcast double* %103 to <2 x double>*
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %104, align 8
  %108 = load <2 x double>, <2 x double>* %106, align 8
  %109 = fmul <2 x double> %107, %108
  %110 = extractelement <2 x double> %109, i32 0
  %111 = extractelement <2 x double> %109, i32 1
  %112 = fsub double %102, %110
  %113 = fsub double %112, %111
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %117 = bitcast double* %116 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %113, %121
  %124 = fsub double %123, %122
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge25.unr-lcssa, label %101

._crit_edge25.unr-lcssa:                          ; preds = %101
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %.prol.loopexit163, %._crit_edge25.unr-lcssa
  %.lcssa157 = phi double [ %.lcssa157.unr, %.prol.loopexit163 ], [ %124, %._crit_edge25.unr-lcssa ]
  %125 = bitcast double %.lcssa157 to i64
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %84, %._crit_edge25
  %126 = phi i64 [ %89, %84 ], [ %125, %._crit_edge25 ]
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %129 = icmp slt i64 %indvars.iv.next103, %10
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %129, label %84, label %._crit_edge9._crit_edge

._crit_edge9._crit_edge:                          ; preds = %._crit_edge73
  br i1 true, label %.lr.ph17, label %._crit_edge9._crit_edge.._crit_edge76_crit_edge

._crit_edge9._crit_edge.._crit_edge76_crit_edge:  ; preds = %._crit_edge9._crit_edge
  br label %._crit_edge76

.lr.ph17:                                         ; preds = %._crit_edge9._crit_edge
  %storemerge215 = add i32 %0, -1
  %130 = sext i32 %storemerge215 to i64
  %131 = add nsw i64 %130, 1
  br label %132

; <label>:132:                                    ; preds = %._crit_edge77, %.lr.ph17
  %indvar = phi i32 [ %indvar.next, %._crit_edge77 ], [ 0, %.lr.ph17 ]
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge77 ], [ %130, %.lr.ph17 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge77 ], [ %0, %.lr.ph17 ]
  %133 = sub i32 %0, %indvar
  %134 = sext i32 %133 to i64
  %135 = sub nsw i64 %130, %134
  %136 = getelementptr inbounds double, double* %4, i64 %indvars.iv89
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv89, 1
  %139 = icmp slt i64 %138, %10
  br i1 %139, label %.lr.ph, label %._crit_edge77

.lr.ph:                                           ; preds = %132
  %140 = sub nsw i64 %131, %134
  %141 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %140, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %142

; <label>:142:                                    ; preds = %142, %.prol.preheader
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %142 ], [ %141, %.prol.preheader ]
  %143 = phi double [ %149, %142 ], [ %137, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %142 ], [ %xtraiter, %.prol.preheader ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87.prol
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv87.prol
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fsub double %143, %148
  %indvars.iv.next88.prol = add nsw i64 %indvars.iv87.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %142, !llvm.loop !26

.prol.loopexit.unr-lcssa:                         ; preds = %142
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %149, %.prol.loopexit.unr-lcssa ]
  %indvars.iv87.unr = phi i64 [ %141, %.lr.ph ], [ %indvars.iv.next88.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %137, %.lr.ph ], [ %149, %.prol.loopexit.unr-lcssa ]
  %150 = icmp ult i64 %135, 3
  br i1 %150, label %._crit_edge12, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %151

; <label>:151:                                    ; preds = %151, %.lr.ph.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr, %.lr.ph.new ], [ %indvars.iv.next88.3, %151 ]
  %152 = phi double [ %.unr, %.lr.ph.new ], [ %174, %151 ]
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87
  %154 = bitcast double* %153 to <2 x double>*
  %155 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %156 = bitcast double* %155 to <2 x double>*
  %157 = load <2 x double>, <2 x double>* %154, align 8
  %158 = load <2 x double>, <2 x double>* %156, align 8
  %159 = fmul <2 x double> %157, %158
  %160 = extractelement <2 x double> %159, i32 0
  %161 = extractelement <2 x double> %159, i32 1
  %162 = fsub double %152, %160
  %163 = fsub double %162, %161
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv.next88.1
  %165 = bitcast double* %164 to <2 x double>*
  %166 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next88.1
  %167 = bitcast double* %166 to <2 x double>*
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %168 = load <2 x double>, <2 x double>* %165, align 8
  %169 = load <2 x double>, <2 x double>* %167, align 8
  %170 = fmul <2 x double> %168, %169
  %171 = extractelement <2 x double> %170, i32 0
  %172 = extractelement <2 x double> %170, i32 1
  %173 = fsub double %163, %171
  %174 = fsub double %173, %172
  %exitcond.3 = icmp eq i64 %indvars.iv.next88.2, %130
  %indvars.iv.next88.3 = add nsw i64 %indvars.iv87, 4
  br i1 %exitcond.3, label %._crit_edge12.unr-lcssa, label %151

._crit_edge12.unr-lcssa:                          ; preds = %151
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.prol.loopexit, %._crit_edge12.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %174, %._crit_edge12.unr-lcssa ]
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %132, %._crit_edge12
  %175 = phi double [ %137, %132 ], [ %.lcssa, %._crit_edge12 ]
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  %177 = load double, double* %176, align 8
  %178 = fdiv double %175, %177
  %179 = getelementptr inbounds double, double* %3, i64 %indvars.iv89
  store double %178, double* %179, align 8
  %indvars.iv.next90 = add i64 %indvars.iv89, -1
  %180 = icmp sgt i64 %indvars.iv89, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %180, label %132, label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge77
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge9._crit_edge.._crit_edge76_crit_edge, %._crit_edge9._crit_edge.thread, %._crit_edge18
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
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!8, !5}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !13, !14}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !13, !14}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
!26 = distinct !{!26, !2}
