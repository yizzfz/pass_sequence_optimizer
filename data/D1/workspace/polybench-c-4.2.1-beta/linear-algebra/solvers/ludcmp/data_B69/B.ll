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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
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
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph64, label %._crit_edge._crit_edge

.lr.ph64:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter208 = and i64 %11, 1
  %lcmp.mod209 = icmp eq i64 %xtraiter208, 0
  br i1 %lcmp.mod209, label %._crit_edge77.prol.loopexit, label %._crit_edge77.prol

._crit_edge77.prol:                               ; preds = %.lr.ph64
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
  br i1 %15, label %._crit_edge11.lr.ph, label %.lr.ph64.new

.lr.ph64.new:                                     ; preds = %._crit_edge77.prol.loopexit
  br label %._crit_edge77

._crit_edge11.lr.ph.loopexit:                     ; preds = %._crit_edge77
  br label %._crit_edge11.lr.ph

._crit_edge11.lr.ph:                              ; preds = %._crit_edge11.lr.ph.loopexit, %._crit_edge77.prol.loopexit
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
  br i1 %35, label %._crit_edge77, label %._crit_edge11.lr.ph.loopexit

._crit_edge11:                                    ; preds = %._crit_edge54, %._crit_edge11.lr.ph
  %indvar203 = phi i64 [ %indvar.next204, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %36 = phi i32 [ %storemerge1051, %._crit_edge54 ], [ 0, %._crit_edge11.lr.ph ]
  %37 = sub i64 %wide.trip.count, %indvar203
  %38 = sub i64 %17, %indvar203
  %39 = icmp slt i32 %36, 0
  br i1 %39, label %._crit_edge11.._crit_edge48_crit_edge, label %.lr.ph47

._crit_edge11.._crit_edge48_crit_edge:            ; preds = %._crit_edge11
  %.pre195 = sext i32 %36 to i64
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

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge11.._crit_edge48_crit_edge
  %.pre-phi = phi i64 [ %.pre195, %._crit_edge11.._crit_edge48_crit_edge ], [ %40, %._crit_edge48.loopexit ]
  %storemerge1051 = add nsw i32 %36, 1
  %49 = icmp slt i32 %storemerge1051, %0
  br i1 %49, label %.lr.ph53, label %._crit_edge54

.lr.ph53:                                         ; preds = %._crit_edge48
  %50 = sext i32 %storemerge1051 to i64
  %xtraiter205 = and i64 %37, 7
  %lcmp.mod206 = icmp eq i64 %xtraiter205, 0
  br i1 %lcmp.mod206, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph53
  br label %51

; <label>:51:                                     ; preds = %51, %.prol.preheader
  %indvars.iv121.prol = phi i64 [ %indvars.iv.next122.prol, %51 ], [ %50, %.prol.preheader ]
  %prol.iter207 = phi i64 [ %prol.iter207.sub, %51 ], [ %xtraiter205, %.prol.preheader ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %indvars.iv121.prol
  store double 0.000000e+00, double* %52, align 8
  %indvars.iv.next122.prol = add nsw i64 %indvars.iv121.prol, 1
  %prol.iter207.sub = add i64 %prol.iter207, -1
  %prol.iter207.cmp = icmp eq i64 %prol.iter207.sub, 0
  br i1 %prol.iter207.cmp, label %.prol.loopexit.loopexit, label %51, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %51
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph53
  %indvars.iv121.unr = phi i64 [ %50, %.lr.ph53 ], [ %indvars.iv.next122.prol, %.prol.loopexit.loopexit ]
  %53 = icmp ult i64 %38, 7
  br i1 %53, label %._crit_edge54, label %.lr.ph53.new

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
  br i1 %exitcond.7, label %._crit_edge54.loopexit, label %54

._crit_edge54.loopexit:                           ; preds = %54
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.prol.loopexit, %._crit_edge48
  %63 = icmp slt i32 %storemerge1051, %0
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %.pre-phi, i64 %.pre-phi
  store double 1.000000e+00, double* %64, align 8
  %indvar.next204 = add i64 %indvar203, 1
  br i1 %63, label %._crit_edge11, label %._crit_edge._crit_edge.loopexit

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge54
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit, %5
  %65 = icmp sgt i32 %0, 0
  %66 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %67 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %66, i8** %67, align 8
  %68 = bitcast i8* %66 to [2000 x [2000 x double]]*
  br i1 %65, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge, label %._crit_edge15

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge:   ; preds = %._crit_edge._crit_edge
  %69 = sext i32 %0 to i64
  %70 = add i32 %0, -1
  %71 = zext i32 %70 to i64
  %72 = shl nuw nsw i64 %71, 3
  %73 = add nuw nsw i64 %72, 8
  %74 = add nsw i64 %69, -1
  %xtraiter200 = and i64 %69, 3
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %._crit_edge40.us.prol.loopexit, label %._crit_edge40.us.prol.preheader

._crit_edge40.us.prol.preheader:                  ; preds = %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge
  br label %._crit_edge40.us.prol

._crit_edge40.us.prol:                            ; preds = %._crit_edge40.us.prol, %._crit_edge40.us.prol.preheader
  %indvars.iv114.prol = phi i64 [ %indvars.iv.next115.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge40.us.prol ], [ 0, %._crit_edge40.us.prol.preheader ]
  %prol.iter202 = phi i64 [ %prol.iter202.sub, %._crit_edge40.us.prol ], [ %xtraiter200, %._crit_edge40.us.prol.preheader ]
  %75 = bitcast i8* %66 to [2000 x [2000 x double]]*
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvar.prol, i64 0
  %scevgep113.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.prol, i8 0, i64 %73, i32 8, i1 false)
  %indvars.iv.next115.prol = add nsw i64 %indvars.iv114.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter202.sub = add i64 %prol.iter202, -1
  %prol.iter202.cmp = icmp eq i64 %prol.iter202.sub, 0
  br i1 %prol.iter202.cmp, label %._crit_edge40.us.prol.loopexit.loopexit, label %._crit_edge40.us.prol, !llvm.loop !3

._crit_edge40.us.prol.loopexit.loopexit:          ; preds = %._crit_edge40.us.prol
  br label %._crit_edge40.us.prol.loopexit

._crit_edge40.us.prol.loopexit:                   ; preds = %._crit_edge40.us.prol.loopexit.loopexit, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge
  %indvars.iv114.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvars.iv.next115.prol, %._crit_edge40.us.prol.loopexit.loopexit ]
  %indvar.unr = phi i64 [ 0, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge ], [ %indvar.next.prol, %._crit_edge40.us.prol.loopexit.loopexit ]
  %76 = icmp ult i64 %74, 3
  br i1 %76, label %._crit_edge13, label %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new

._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new: ; preds = %._crit_edge40.us.prol.loopexit
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvars.iv.next115.3, %._crit_edge40.us ]
  %indvar = phi i64 [ %indvar.unr, %._crit_edge12.lr.ph.._crit_edge12.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge40.us ]
  %77 = bitcast i8* %66 to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvar, i64 0
  %scevgep113 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113, i8 0, i64 %73, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvar.next, i64 0
  %scevgep113.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.1, i8 0, i64 %73, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvar.next.1, i64 0
  %scevgep113.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.2, i8 0, i64 %73, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvar.next.2, i64 0
  %scevgep113.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113.3, i8 0, i64 %73, i32 8, i1 false)
  %indvars.iv.next115.3 = add nsw i64 %indvars.iv114, 4
  %78 = icmp slt i64 %indvars.iv.next115.3, %69
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %78, label %._crit_edge40.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %._crit_edge40.us.prol.loopexit
  %.pr131.pre = load i32, i32* %6, align 4
  %79 = icmp sgt i32 %.pr131.pre, 0
  br i1 %79, label %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge, label %._crit_edge15.thread

._crit_edge15.thread:                             ; preds = %._crit_edge13
  %80 = bitcast [2000 x [2000 x double]]** %8 to i8**
  %.pre = load i8*, i8** %80, align 8
  br label %._crit_edge15._crit_edge

._crit_edge14.lr.ph.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge13
  %81 = sext i32 %.pr131.pre to i64
  %82 = load [2000 x double]*, [2000 x double]** %7, align 8
  %83 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %84 = add i32 %.pr131.pre, -1
  %wide.trip.count104 = zext i32 %84 to i64
  %85 = add nuw nsw i64 %wide.trip.count104, 1
  %86 = add nuw nsw i64 %wide.trip.count104, 1
  %n.vec = and i64 %85, 8589934588
  %87 = bitcast [2000 x [2000 x double]]* %83 to i8*
  br label %._crit_edge16.us.us.preheader

._crit_edge16.us.us.preheader:                    ; preds = %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge, %._crit_edge29.us
  %indvar145 = phi i64 [ %88, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge29.us ], [ 0, %._crit_edge14.lr.ph.._crit_edge14.us_crit_edge ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %82, i64 0, i64 %indvar145
  %88 = add i64 %indvar145, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %82, i64 %wide.trip.count104, i64 %88
  br label %._crit_edge16.us.us

._crit_edge29.us:                                 ; preds = %._crit_edge27.us.us
  %indvars.iv.next109 = add nsw i64 %indvars.iv108, 1
  %89 = icmp slt i64 %indvars.iv.next109, %81
  br i1 %89, label %._crit_edge16.us.us.preheader, label %._crit_edge15.loopexit

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.preheader, %._crit_edge27.us.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge27.us.us ], [ 0, %._crit_edge16.us.us.preheader ]
  %90 = icmp ult i64 %85, 4
  %scevgep141 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 0
  %scevgep143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 %85
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %indvars.iv106, i64 %indvars.iv108
  br i1 %90, label %scalar.ph.preheader, label %min.iters.checked

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge16.us.us
  %indvars.iv102.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge16.us.us ], [ %n.vec, %middle.block ]
  %92 = sub nsw i64 %86, %indvars.iv102.ph
  %xtraiter198 = and i64 %92, 1
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod199, label %scalar.ph.prol.loopexit, label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader
  %93 = load double, double* %91, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %indvars.iv102.ph, i64 %indvars.iv108
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 %indvars.iv102.ph
  %98 = load double, double* %97, align 8
  %99 = fadd double %98, %96
  store double %99, double* %97, align 8
  %indvars.iv.next103.prol = or i64 %indvars.iv102.ph, 1
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol, %scalar.ph.preheader
  %indvars.iv102.unr.ph = phi i64 [ %indvars.iv.next103.prol, %scalar.ph.prol ], [ %indvars.iv102.ph, %scalar.ph.preheader ]
  %100 = icmp eq i64 %wide.trip.count104, %indvars.iv102.ph
  br i1 %100, label %._crit_edge27.us.us, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

min.iters.checked:                                ; preds = %._crit_edge16.us.us
  %101 = icmp eq i64 %n.vec, 0
  br i1 %101, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep141, %scevgep149
  %bound1 = icmp ult double* %scevgep147, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bound0152 = icmp ult double* %scevgep141, %91
  %bound1153 = icmp ult double* %91, %scevgep143
  %found.conflict154 = and i1 %bound0152, %bound1153
  %conflict.rdx = or i1 %found.conflict, %found.conflict154
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %102 = or i64 %index, 1
  %103 = or i64 %index, 2
  %104 = or i64 %index, 3
  %105 = load double, double* %91, align 8, !alias.scope !4
  %106 = insertelement <2 x double> undef, double %105, i32 0
  %107 = shufflevector <2 x double> %106, <2 x double> undef, <2 x i32> zeroinitializer
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %index, i64 %indvars.iv108
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %102, i64 %indvars.iv108
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %103, i64 %indvars.iv108
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %104, i64 %indvars.iv108
  %112 = load double, double* %108, align 8, !alias.scope !7
  %113 = load double, double* %109, align 8, !alias.scope !7
  %114 = load double, double* %110, align 8, !alias.scope !7
  %115 = load double, double* %111, align 8, !alias.scope !7
  %116 = insertelement <2 x double> undef, double %112, i32 0
  %117 = insertelement <2 x double> %116, double %113, i32 1
  %118 = insertelement <2 x double> undef, double %114, i32 0
  %119 = insertelement <2 x double> %118, double %115, i32 1
  %120 = fmul <2 x double> %107, %117
  %121 = fmul <2 x double> %107, %119
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 %index
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !9, !noalias !11
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !9, !noalias !11
  %126 = fadd <2 x double> %wide.load, %120
  %127 = fadd <2 x double> %wide.load156, %121
  store <2 x double> %126, <2 x double>* %123, align 8, !alias.scope !9, !noalias !11
  store <2 x double> %127, <2 x double>* %125, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %128 = icmp eq i64 %index.next, %n.vec
  br i1 %128, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %129 = icmp eq i64 %85, %n.vec
  br i1 %129, label %._crit_edge27.us.us, label %scalar.ph.preheader

._crit_edge27.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge27.us.us

._crit_edge27.us.us:                              ; preds = %._crit_edge27.us.us.loopexit, %scalar.ph.prol.loopexit, %middle.block
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next107, %81
  br i1 %exitcond135, label %._crit_edge29.us, label %._crit_edge16.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next103.1, %scalar.ph ]
  %130 = load double, double* %91, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %indvars.iv102, i64 %indvars.iv108
  %132 = load double, double* %131, align 8
  %133 = fmul double %130, %132
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 %indvars.iv102
  %135 = load double, double* %134, align 8
  %136 = fadd double %135, %133
  store double %136, double* %134, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %137 = load double, double* %91, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 %indvars.iv.next103, i64 %indvars.iv108
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next103
  %142 = load double, double* %141, align 8
  %143 = fadd double %142, %140
  store double %143, double* %141, align 8
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  br i1 %exitcond105.1, label %._crit_edge27.us.us.loopexit, label %scalar.ph, !llvm.loop !15

._crit_edge15.loopexit:                           ; preds = %._crit_edge29.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %._crit_edge._crit_edge
  %144 = phi i8* [ %66, %._crit_edge._crit_edge ], [ %87, %._crit_edge15.loopexit ]
  %145 = phi [2000 x double]* [ %1, %._crit_edge._crit_edge ], [ %82, %._crit_edge15.loopexit ]
  %146 = phi [2000 x [2000 x double]]* [ %68, %._crit_edge._crit_edge ], [ %83, %._crit_edge15.loopexit ]
  %147 = phi i32 [ %0, %._crit_edge._crit_edge ], [ %.pr131.pre, %._crit_edge15.loopexit ]
  %148 = icmp sgt i32 %147, 0
  br i1 %148, label %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge, label %._crit_edge15._crit_edge

._crit_edge17.lr.ph.._crit_edge17.us_crit_edge:   ; preds = %._crit_edge15
  %149 = sext i32 %147 to i64
  %150 = add i32 %147, -1
  %wide.trip.count98 = zext i32 %150 to i64
  %151 = add nuw nsw i64 %wide.trip.count98, 1
  %152 = and i64 %151, 8589934588
  %153 = add nsw i64 %152, -4
  %154 = lshr exact i64 %153, 2
  %155 = add nuw nsw i64 %wide.trip.count98, 1
  %n.vec163 = and i64 %151, 8589934588
  %156 = and i64 %154, 1
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge19.us, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge
  %indvar166 = phi i64 [ %indvar.next167, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge19.us ], [ 0, %._crit_edge17.lr.ph.._crit_edge17.us_crit_edge ]
  %157 = icmp ult i64 %151, 4
  %scevgep168 = getelementptr [2000 x double], [2000 x double]* %145, i64 %indvar166, i64 0
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %145, i64 %indvar166, i64 %151
  %scevgep172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvar166, i64 0
  %scevgep174 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvar166, i64 %151
  br i1 %157, label %scalar.ph159.preheader, label %min.iters.checked161

min.iters.checked161:                             ; preds = %._crit_edge17.us
  %158 = icmp eq i64 %n.vec163, 0
  br i1 %158, label %scalar.ph159.preheader, label %vector.memcheck180

vector.memcheck180:                               ; preds = %min.iters.checked161
  %bound0176 = icmp ult double* %scevgep168, %scevgep174
  %bound1177 = icmp ult double* %scevgep172, %scevgep170
  %memcheck.conflict179 = and i1 %bound0176, %bound1177
  br i1 %memcheck.conflict179, label %scalar.ph159.preheader, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %vector.memcheck180
  %159 = icmp eq i64 %156, 0
  br i1 %159, label %vector.body157.prol, label %vector.body157.prol.loopexit

vector.body157.prol:                              ; preds = %vector.body157.preheader
  %160 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 0
  %161 = bitcast double* %160 to <2 x i64>*
  %wide.load190.prol = load <2 x i64>, <2 x i64>* %161, align 8, !alias.scope !16
  %162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 2
  %163 = bitcast double* %162 to <2 x i64>*
  %wide.load191.prol = load <2 x i64>, <2 x i64>* %163, align 8, !alias.scope !16
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 0
  %165 = bitcast double* %164 to <2 x i64>*
  store <2 x i64> %wide.load190.prol, <2 x i64>* %165, align 8, !alias.scope !19, !noalias !16
  %166 = getelementptr [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 2
  %167 = bitcast double* %166 to <2 x i64>*
  store <2 x i64> %wide.load191.prol, <2 x i64>* %167, align 8, !alias.scope !19, !noalias !16
  br label %vector.body157.prol.loopexit

vector.body157.prol.loopexit:                     ; preds = %vector.body157.prol, %vector.body157.preheader
  %index182.unr.ph = phi i64 [ 4, %vector.body157.prol ], [ 0, %vector.body157.preheader ]
  %168 = icmp eq i64 %154, 0
  br i1 %168, label %middle.block158, label %vector.body157.preheader.new

vector.body157.preheader.new:                     ; preds = %vector.body157.prol.loopexit
  br label %vector.body157

vector.body157:                                   ; preds = %vector.body157, %vector.body157.preheader.new
  %index182 = phi i64 [ %index182.unr.ph, %vector.body157.preheader.new ], [ %index.next183.1, %vector.body157 ]
  %169 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %index182
  %170 = bitcast double* %169 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %170, align 8, !alias.scope !16
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %172, align 8, !alias.scope !16
  %173 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %index182
  %174 = bitcast double* %173 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %174, align 8, !alias.scope !19, !noalias !16
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %176, align 8, !alias.scope !19, !noalias !16
  %index.next183 = add i64 %index182, 4
  %177 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %index.next183
  %178 = bitcast double* %177 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %178, align 8, !alias.scope !16
  %179 = getelementptr double, double* %177, i64 2
  %180 = bitcast double* %179 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %180, align 8, !alias.scope !16
  %181 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %index.next183
  %182 = bitcast double* %181 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %182, align 8, !alias.scope !19, !noalias !16
  %183 = getelementptr double, double* %181, i64 2
  %184 = bitcast double* %183 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %184, align 8, !alias.scope !19, !noalias !16
  %index.next183.1 = add i64 %index182, 8
  %185 = icmp eq i64 %index.next183.1, %n.vec163
  br i1 %185, label %middle.block158.loopexit, label %vector.body157, !llvm.loop !21

middle.block158.loopexit:                         ; preds = %vector.body157
  br label %middle.block158

middle.block158:                                  ; preds = %middle.block158.loopexit, %vector.body157.prol.loopexit
  %186 = icmp eq i64 %151, %n.vec163
  br i1 %186, label %._crit_edge19.us, label %scalar.ph159.preheader

scalar.ph159.preheader:                           ; preds = %middle.block158, %vector.memcheck180, %min.iters.checked161, %._crit_edge17.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck180 ], [ 0, %min.iters.checked161 ], [ 0, %._crit_edge17.us ], [ %n.vec163, %middle.block158 ]
  %187 = sub nsw i64 %155, %indvars.iv.ph
  %188 = sub nsw i64 %wide.trip.count98, %indvars.iv.ph
  %xtraiter196 = and i64 %187, 3
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197, label %scalar.ph159.prol.loopexit, label %scalar.ph159.prol.preheader

scalar.ph159.prol.preheader:                      ; preds = %scalar.ph159.preheader
  br label %scalar.ph159.prol

scalar.ph159.prol:                                ; preds = %scalar.ph159.prol, %scalar.ph159.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph159.prol ], [ %indvars.iv.ph, %scalar.ph159.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph159.prol ], [ %xtraiter196, %scalar.ph159.prol.preheader ]
  %189 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %indvars.iv.prol
  %190 = bitcast double* %189 to i64*
  %191 = load i64, i64* %190, align 8
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %indvars.iv.prol
  %193 = bitcast double* %192 to i64*
  store i64 %191, i64* %193, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph159.prol.loopexit.loopexit, label %scalar.ph159.prol, !llvm.loop !22

scalar.ph159.prol.loopexit.loopexit:              ; preds = %scalar.ph159.prol
  br label %scalar.ph159.prol.loopexit

scalar.ph159.prol.loopexit:                       ; preds = %scalar.ph159.prol.loopexit.loopexit, %scalar.ph159.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph159.preheader ], [ %indvars.iv.next.prol, %scalar.ph159.prol.loopexit.loopexit ]
  %194 = icmp ult i64 %188, 3
  br i1 %194, label %._crit_edge19.us, label %scalar.ph159.preheader.new

scalar.ph159.preheader.new:                       ; preds = %scalar.ph159.prol.loopexit
  br label %scalar.ph159

scalar.ph159:                                     ; preds = %scalar.ph159, %scalar.ph159.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph159.preheader.new ], [ %indvars.iv.next.3, %scalar.ph159 ]
  %195 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %indvars.iv
  %196 = bitcast double* %195 to i64*
  %197 = load i64, i64* %196, align 8
  %198 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %indvars.iv
  %199 = bitcast double* %198 to i64*
  store i64 %197, i64* %199, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %200 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next
  %201 = bitcast double* %200 to i64*
  %202 = load i64, i64* %201, align 8
  %203 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %indvars.iv.next
  %204 = bitcast double* %203 to i64*
  store i64 %202, i64* %204, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %205 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %206 = bitcast double* %205 to i64*
  %207 = load i64, i64* %206, align 8
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %indvars.iv.next.1
  %209 = bitcast double* %208 to i64*
  store i64 %207, i64* %209, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %210 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %146, i64 0, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %211 = bitcast double* %210 to i64*
  %212 = load i64, i64* %211, align 8
  %213 = getelementptr inbounds [2000 x double], [2000 x double]* %145, i64 %indvars.iv100, i64 %indvars.iv.next.2
  %214 = bitcast double* %213 to i64*
  store i64 %212, i64* %214, align 8
  %exitcond99.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count98
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond99.3, label %._crit_edge19.us.loopexit, label %scalar.ph159, !llvm.loop !23

._crit_edge19.us.loopexit:                        ; preds = %scalar.ph159
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %scalar.ph159.prol.loopexit, %middle.block158
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %215 = icmp slt i64 %indvars.iv.next101, %149
  %indvar.next167 = add i64 %indvar166, 1
  br i1 %215, label %._crit_edge17.us, label %._crit_edge15._crit_edge.loopexit

._crit_edge15._crit_edge.loopexit:                ; preds = %._crit_edge19.us
  br label %._crit_edge15._crit_edge

._crit_edge15._crit_edge:                         ; preds = %._crit_edge15._crit_edge.loopexit, %._crit_edge15, %._crit_edge15.thread
  %216 = phi i8* [ %144, %._crit_edge15 ], [ %.pre, %._crit_edge15.thread ], [ %144, %._crit_edge15._crit_edge.loopexit ]
  tail call void @free(i8* %216) #4
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

._crit_edge9.loopexit:                            ; preds = %._crit_edge55
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph29, label %._crit_edge76

.lr.ph29:                                         ; preds = %._crit_edge9
  %11 = sext i32 %0 to i64
  br label %86

._crit_edge:                                      ; preds = %._crit_edge55, %._crit_edge.lr.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge55 ], [ 0, %._crit_edge.lr.ph ]
  %indvars.iv129 = phi i32 [ %16, %._crit_edge55 ], [ -1, %._crit_edge.lr.ph ]
  %12 = add i64 %indvars.iv137, 4294967295
  %13 = and i64 %12, 4294967295
  %14 = sub i64 %9, %indvars.iv137
  %15 = sub i64 %wide.trip.count120, %indvars.iv137
  %16 = add i32 %indvars.iv129, 1
  %17 = icmp sgt i64 %indvars.iv137, 0
  br i1 %17, label %.lr.ph41.preheader, label %._crit_edge42

.lr.ph41.preheader:                               ; preds = %._crit_edge
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %._crit_edge69
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge69 ], [ 0, %.lr.ph41.preheader ]
  %indvars.iv110 = phi i32 [ %21, %._crit_edge69 ], [ -1, %.lr.ph41.preheader ]
  %19 = add i64 %indvars.iv114, 4294967295
  %20 = and i64 %19, 4294967295
  %21 = add i32 %indvars.iv110, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %23 = load double, double* %22, align 8
  %24 = icmp sgt i64 %indvars.iv114, 0
  br i1 %24, label %.lr.ph36, label %._crit_edge69

.lr.ph36:                                         ; preds = %.lr.ph41
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %25 = and i64 %19, 1
  %lcmp.mod172 = icmp eq i64 %25, 0
  br i1 %lcmp.mod172, label %26, label %.prol.loopexit170

; <label>:26:                                     ; preds = %.lr.ph36
  %27 = load double, double* %18, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %23, %30
  br label %.prol.loopexit170

.prol.loopexit170:                                ; preds = %26, %.lr.ph36
  %.lcssa160.unr.ph = phi double [ %31, %26 ], [ undef, %.lr.ph36 ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %26 ], [ 0, %.lr.ph36 ]
  %.unr173.ph = phi double [ %31, %26 ], [ %23, %.lr.ph36 ]
  %32 = icmp eq i64 %20, 0
  br i1 %32, label %._crit_edge69, label %.lr.ph36.new

.lr.ph36.new:                                     ; preds = %.prol.loopexit170
  br label %33

; <label>:33:                                     ; preds = %33, %.lr.ph36.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph36.new ], [ %indvars.iv.next105.1, %33 ]
  %34 = phi double [ %.unr173.ph, %.lr.ph36.new ], [ %48, %33 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
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
  br i1 %exitcond113.1, label %._crit_edge69.loopexit, label %33

._crit_edge69.loopexit:                           ; preds = %33
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69.loopexit, %.prol.loopexit170, %.lr.ph41
  %49 = phi double [ %23, %.lr.ph41 ], [ %.lcssa160.unr.ph, %.prol.loopexit170 ], [ %48, %._crit_edge69.loopexit ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %51 = load double, double* %50, align 8
  %52 = fdiv double %49, %51
  store double %52, double* %22, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %53 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %53, label %.lr.ph41, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %._crit_edge69
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %._crit_edge
  %54 = icmp slt i64 %indvars.iv137, %8
  br i1 %54, label %.lr.ph54, label %._crit_edge55

.lr.ph54:                                         ; preds = %._crit_edge42
  %55 = icmp sgt i64 %indvars.iv137, 0
  br i1 %55, label %.lr.ph54.split.us.preheader, label %.lr.ph54.split.preheader

.lr.ph54.split.preheader:                         ; preds = %.lr.ph54
  %xtraiter174 = and i64 %14, 3
  %lcmp.mod175 = icmp eq i64 %xtraiter174, 0
  br i1 %lcmp.mod175, label %.lr.ph54.split.prol.loopexit, label %.lr.ph54.split.prol.preheader

.lr.ph54.split.prol.preheader:                    ; preds = %.lr.ph54.split.preheader
  br label %.lr.ph54.split.prol

.lr.ph54.split.prol:                              ; preds = %.lr.ph54.split.prol, %.lr.ph54.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph54.split.prol ], [ %indvars.iv137, %.lr.ph54.split.prol.preheader ]
  %prol.iter176 = phi i64 [ %prol.iter176.sub, %.lr.ph54.split.prol ], [ %xtraiter174, %.lr.ph54.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter176.sub = add i64 %prol.iter176, -1
  %prol.iter176.cmp = icmp eq i64 %prol.iter176.sub, 0
  br i1 %prol.iter176.cmp, label %.lr.ph54.split.prol.loopexit.loopexit, label %.lr.ph54.split.prol, !llvm.loop !24

.lr.ph54.split.prol.loopexit.loopexit:            ; preds = %.lr.ph54.split.prol
  br label %.lr.ph54.split.prol.loopexit

.lr.ph54.split.prol.loopexit:                     ; preds = %.lr.ph54.split.prol.loopexit.loopexit, %.lr.ph54.split.preheader
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph54.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph54.split.prol.loopexit.loopexit ]
  %56 = icmp ult i64 %15, 3
  br i1 %56, label %._crit_edge55, label %.lr.ph54.split.preheader.new

.lr.ph54.split.preheader.new:                     ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph54.split

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %57 = and i64 %12, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph54.split.us

.lr.ph54.split.us:                                ; preds = %._crit_edge48.us, %.lr.ph54.split.us.preheader
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge48.us ], [ %indvars.iv137, %.lr.ph54.split.us.preheader ]
  %59 = icmp eq i64 %57, 0
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %61 = load double, double* %60, align 8
  br i1 %59, label %62, label %.prol.loopexit178

; <label>:62:                                     ; preds = %.lr.ph54.split.us
  %63 = load double, double* %58, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %61, %66
  br label %.prol.loopexit178

.prol.loopexit178:                                ; preds = %62, %.lr.ph54.split.us
  %.lcssa162.unr.ph = phi double [ %67, %62 ], [ undef, %.lr.ph54.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %62 ], [ 0, %.lr.ph54.split.us ]
  %.unr181.ph = phi double [ %67, %62 ], [ %61, %.lr.ph54.split.us ]
  %68 = icmp eq i64 %13, 0
  br i1 %68, label %._crit_edge48.us, label %.lr.ph54.split.us.new

.lr.ph54.split.us.new:                            ; preds = %.prol.loopexit178
  br label %69

; <label>:69:                                     ; preds = %69, %.lr.ph54.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph54.split.us.new ], [ %indvars.iv.next124.1, %69 ]
  %70 = phi double [ %.unr181.ph, %.lr.ph54.split.us.new ], [ %84, %69 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %72 = bitcast double* %71 to <2 x double>*
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %74 = load double, double* %73, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %75 = load <2 x double>, <2 x double>* %72, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %77 = load double, double* %76, align 8
  %78 = insertelement <2 x double> undef, double %74, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fmul <2 x double> %75, %79
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = fsub double %70, %81
  %84 = fsub double %83, %82
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge48.us.loopexit, label %69

._crit_edge48.us.loopexit:                        ; preds = %69
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit178
  %.lcssa162 = phi double [ %.lcssa162.unr.ph, %.prol.loopexit178 ], [ %84, %._crit_edge48.us.loopexit ]
  store double %.lcssa162, double* %60, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next136, %8
  br i1 %exitcond145, label %._crit_edge55.loopexit, label %.lr.ph54.split.us

.lr.ph54.split:                                   ; preds = %.lr.ph54.split, %.lr.ph54.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph54.split.preheader.new ], [ %indvars.iv.next119.3, %.lr.ph54.split ]
  %indvars.iv.next119.2 = add i64 %indvars.iv118, 3
  %exitcond121.3 = icmp eq i64 %indvars.iv.next119.2, %wide.trip.count120
  %indvars.iv.next119.3 = add i64 %indvars.iv118, 4
  br i1 %exitcond121.3, label %._crit_edge55.loopexit188, label %.lr.ph54.split

._crit_edge55.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge55

._crit_edge55.loopexit188:                        ; preds = %.lr.ph54.split
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit188, %._crit_edge55.loopexit, %.lr.ph54.split.prol.loopexit, %._crit_edge42
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %85 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %85, label %._crit_edge, label %._crit_edge9.loopexit

; <label>:86:                                     ; preds = %._crit_edge73, %.lr.ph29
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge73 ], [ 0, %.lr.ph29 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge73 ], [ -1, %.lr.ph29 ]
  %87 = add i64 %indvars.iv102, 4294967295
  %88 = and i64 %87, 4294967295
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = icmp sgt i64 %indvars.iv102, 0
  %93 = bitcast i64 %91 to double
  br i1 %92, label %.lr.ph24, label %._crit_edge73

.lr.ph24:                                         ; preds = %86
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter165 = and i64 %indvars.iv102, 3
  %lcmp.mod166 = icmp eq i64 %xtraiter165, 0
  br i1 %lcmp.mod166, label %.prol.loopexit164, label %.prol.preheader163

.prol.preheader163:                               ; preds = %.lr.ph24
  br label %94

; <label>:94:                                     ; preds = %94, %.prol.preheader163
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %94 ], [ 0, %.prol.preheader163 ]
  %95 = phi double [ %101, %94 ], [ %93, %.prol.preheader163 ]
  %prol.iter167 = phi i64 [ %prol.iter167.sub, %94 ], [ %xtraiter165, %.prol.preheader163 ]
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fsub double %95, %100
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter167.sub = add i64 %prol.iter167, -1
  %prol.iter167.cmp = icmp eq i64 %prol.iter167.sub, 0
  br i1 %prol.iter167.cmp, label %.prol.loopexit164.loopexit, label %94, !llvm.loop !25

.prol.loopexit164.loopexit:                       ; preds = %94
  br label %.prol.loopexit164

.prol.loopexit164:                                ; preds = %.prol.loopexit164.loopexit, %.lr.ph24
  %.lcssa158.unr = phi double [ undef, %.lr.ph24 ], [ %101, %.prol.loopexit164.loopexit ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next93.prol, %.prol.loopexit164.loopexit ]
  %.unr168 = phi double [ %93, %.lr.ph24 ], [ %101, %.prol.loopexit164.loopexit ]
  %102 = icmp ult i64 %88, 3
  br i1 %102, label %._crit_edge25, label %.lr.ph24.new

.lr.ph24.new:                                     ; preds = %.prol.loopexit164
  br label %103

; <label>:103:                                    ; preds = %103, %.lr.ph24.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph24.new ], [ %indvars.iv.next93.3, %103 ]
  %104 = phi double [ %.unr168, %.lr.ph24.new ], [ %126, %103 ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %106 = bitcast double* %105 to <2 x double>*
  %107 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %108 = bitcast double* %107 to <2 x double>*
  %109 = load <2 x double>, <2 x double>* %106, align 8
  %110 = load <2 x double>, <2 x double>* %108, align 8
  %111 = fmul <2 x double> %109, %110
  %112 = extractelement <2 x double> %111, i32 0
  %113 = extractelement <2 x double> %111, i32 1
  %114 = fsub double %104, %112
  %115 = fsub double %114, %113
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %117 = bitcast double* %116 to <2 x double>*
  %118 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %119 = bitcast double* %118 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %120 = load <2 x double>, <2 x double>* %117, align 8
  %121 = load <2 x double>, <2 x double>* %119, align 8
  %122 = fmul <2 x double> %120, %121
  %123 = extractelement <2 x double> %122, i32 0
  %124 = extractelement <2 x double> %122, i32 1
  %125 = fsub double %115, %123
  %126 = fsub double %125, %124
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge25.loopexit, label %103

._crit_edge25.loopexit:                           ; preds = %103
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.prol.loopexit164
  %.lcssa158 = phi double [ %.lcssa158.unr, %.prol.loopexit164 ], [ %126, %._crit_edge25.loopexit ]
  %127 = bitcast double %.lcssa158 to i64
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %86, %._crit_edge25
  %128 = phi i64 [ %91, %86 ], [ %127, %._crit_edge25 ]
  %129 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %131 = icmp slt i64 %indvars.iv.next103, %11
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %131, label %86, label %.lr.ph17

.lr.ph17:                                         ; preds = %._crit_edge73
  %storemerge215 = add i32 %0, -1
  %132 = sext i32 %storemerge215 to i64
  %133 = add nsw i64 %132, 1
  br label %134

; <label>:134:                                    ; preds = %._crit_edge77, %.lr.ph17
  %indvar = phi i32 [ %indvar.next, %._crit_edge77 ], [ 0, %.lr.ph17 ]
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %._crit_edge77 ], [ %132, %.lr.ph17 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge77 ], [ %0, %.lr.ph17 ]
  %135 = sub i32 %0, %indvar
  %136 = sext i32 %135 to i64
  %137 = sub nsw i64 %132, %136
  %138 = getelementptr inbounds double, double* %4, i64 %indvars.iv89
  %139 = load double, double* %138, align 8
  %140 = add nsw i64 %indvars.iv89, 1
  %141 = icmp slt i64 %140, %11
  br i1 %141, label %.lr.ph, label %._crit_edge77

.lr.ph:                                           ; preds = %134
  %142 = sub nsw i64 %133, %136
  %143 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %142, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %144

; <label>:144:                                    ; preds = %144, %.prol.preheader
  %indvars.iv87.prol = phi i64 [ %indvars.iv.next88.prol, %144 ], [ %143, %.prol.preheader ]
  %145 = phi double [ %151, %144 ], [ %139, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %144 ], [ %xtraiter, %.prol.preheader ]
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87.prol
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds double, double* %3, i64 %indvars.iv87.prol
  %149 = load double, double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fsub double %145, %150
  %indvars.iv.next88.prol = add nsw i64 %indvars.iv87.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %144, !llvm.loop !26

.prol.loopexit.loopexit:                          ; preds = %144
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %151, %.prol.loopexit.loopexit ]
  %indvars.iv87.unr = phi i64 [ %143, %.lr.ph ], [ %indvars.iv.next88.prol, %.prol.loopexit.loopexit ]
  %.unr = phi double [ %139, %.lr.ph ], [ %151, %.prol.loopexit.loopexit ]
  %152 = icmp ult i64 %137, 3
  br i1 %152, label %._crit_edge77, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %153

; <label>:153:                                    ; preds = %153, %.lr.ph.new
  %indvars.iv87 = phi i64 [ %indvars.iv87.unr, %.lr.ph.new ], [ %indvars.iv.next88.3, %153 ]
  %154 = phi double [ %.unr, %.lr.ph.new ], [ %176, %153 ]
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv87
  %156 = bitcast double* %155 to <2 x double>*
  %157 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  %158 = bitcast double* %157 to <2 x double>*
  %159 = load <2 x double>, <2 x double>* %156, align 8
  %160 = load <2 x double>, <2 x double>* %158, align 8
  %161 = fmul <2 x double> %159, %160
  %162 = extractelement <2 x double> %161, i32 0
  %163 = extractelement <2 x double> %161, i32 1
  %164 = fsub double %154, %162
  %165 = fsub double %164, %163
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv.next88.1
  %167 = bitcast double* %166 to <2 x double>*
  %168 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next88.1
  %169 = bitcast double* %168 to <2 x double>*
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %170 = load <2 x double>, <2 x double>* %167, align 8
  %171 = load <2 x double>, <2 x double>* %169, align 8
  %172 = fmul <2 x double> %170, %171
  %173 = extractelement <2 x double> %172, i32 0
  %174 = extractelement <2 x double> %172, i32 1
  %175 = fsub double %165, %173
  %176 = fsub double %175, %174
  %exitcond.3 = icmp eq i64 %indvars.iv.next88.2, %132
  %indvars.iv.next88.3 = add nsw i64 %indvars.iv87, 4
  br i1 %exitcond.3, label %._crit_edge77.loopexit, label %153

._crit_edge77.loopexit:                           ; preds = %153
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.prol.loopexit, %134
  %177 = phi double [ %139, %134 ], [ %.lcssa.unr, %.prol.loopexit ], [ %176, %._crit_edge77.loopexit ]
  %178 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv89, i64 %indvars.iv89
  %179 = load double, double* %178, align 8
  %180 = fdiv double %177, %179
  %181 = getelementptr inbounds double, double* %3, i64 %indvars.iv89
  store double %180, double* %181, align 8
  %indvars.iv.next90 = add i64 %indvars.iv89, -1
  %182 = icmp sgt i64 %indvars.iv89, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %182, label %134, label %._crit_edge76.loopexit

._crit_edge76.loopexit:                           ; preds = %._crit_edge77
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.loopexit, %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge1.loopexit

._crit_edge1.loopexit:                            ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
