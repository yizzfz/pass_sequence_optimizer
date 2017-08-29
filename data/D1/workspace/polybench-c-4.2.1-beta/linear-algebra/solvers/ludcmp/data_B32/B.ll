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
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph32, label %.preheader15.thread

.preheader15.thread:                              ; preds = %5
  br label %.preheader15._crit_edge

.lr.ph32:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter223 = and i64 %11, 1
  %lcmp.mod224 = icmp eq i64 %xtraiter223, 0
  br i1 %lcmp.mod224, label %._crit_edge.prol.loopexit, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph32
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %.lr.ph32, %._crit_edge.prol
  %indvars.iv125.unr = phi i64 [ 0, %.lr.ph32 ], [ 1, %._crit_edge.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %.preheader15, label %.lr.ph32.new

.lr.ph32.new:                                     ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

.preheader15.unr-lcssa:                           ; preds = %._crit_edge
  br label %.preheader15

.preheader15:                                     ; preds = %._crit_edge.prol.loopexit, %.preheader15.unr-lcssa
  br i1 true, label %.preheader14.lr.ph, label %.preheader15..preheader15._crit_edge_crit_edge

.preheader15..preheader15._crit_edge_crit_edge:   ; preds = %.preheader15
  br label %.preheader15._crit_edge

.preheader14.lr.ph:                               ; preds = %.preheader15
  %16 = add i32 %0, -1
  %wide.trip.count = sext i32 %16 to i64
  %17 = add nsw i64 %wide.trip.count, 1
  br label %.preheader14

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph32.new
  %indvars.iv125 = phi i64 [ %indvars.iv125.unr, %.lr.ph32.new ], [ %indvars.iv.next126.1, %._crit_edge ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv125
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv125
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %22 = trunc i64 %indvars.iv.next126 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv125
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %25 = trunc i64 %indvars.iv.next126.1 to i32
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
  %35 = icmp slt i64 %indvars.iv.next126.1, %11
  br i1 %35, label %._crit_edge, label %.preheader15.unr-lcssa

.preheader14:                                     ; preds = %._crit_edge28, %.preheader14.lr.ph
  %indvar135 = phi i32 [ %40, %._crit_edge28 ], [ 0, %.preheader14.lr.ph ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge28 ], [ 0, %.preheader14.lr.ph ]
  %indvars.iv119.in = phi i32 [ %indvars.iv119, %._crit_edge28 ], [ 0, %.preheader14.lr.ph ]
  %indvars.iv115 = phi i32 [ %indvars.iv.next116, %._crit_edge28 ], [ 0, %.preheader14.lr.ph ]
  %36 = sub i64 %wide.trip.count, %indvars.iv123
  %37 = add i64 %36, -4
  %38 = lshr i64 %37, 2
  %39 = add nuw nsw i64 %38, 1
  %40 = add i32 %indvar135, 1
  %41 = sext i32 %40 to i64
  %42 = sub nsw i64 %17, %41
  %indvars.iv119 = add i32 %indvars.iv119.in, 1
  %43 = sext i32 %indvars.iv119 to i64
  %44 = icmp slt i64 %indvars.iv123, 0
  br i1 %44, label %._crit_edge24, label %.lr.ph23

.lr.ph23:                                         ; preds = %.preheader14
  %wide.trip.count117 = zext i32 %indvars.iv115 to i64
  br label %45

; <label>:45:                                     ; preds = %45, %.lr.ph23
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %45 ], [ 0, %.lr.ph23 ]
  %46 = sub nsw i64 0, %indvars.iv111
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %9
  %51 = fadd double %50, 1.000000e+00
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv111
  store double %51, double* %52, align 8
  %exitcond118 = icmp eq i64 %indvars.iv111, %wide.trip.count117
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  br i1 %exitcond118, label %._crit_edge24.loopexit, label %45

._crit_edge24.loopexit:                           ; preds = %45
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.preheader14
  %indvars.iv.next124 = add i64 %indvars.iv123, 1
  %53 = icmp slt i64 %indvars.iv.next124, %11
  br i1 %53, label %.lr.ph27.preheader, label %._crit_edge28

.lr.ph27.preheader:                               ; preds = %._crit_edge24
  %min.iters.check = icmp ult i64 %42, 4
  br i1 %min.iters.check, label %.lr.ph27.preheader208, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph27.preheader
  %n.vec = and i64 %42, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %43, %n.vec
  br i1 %cmp.zero, label %.lr.ph27.preheader208, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter220 = and i64 %39, 3
  %lcmp.mod221 = icmp eq i64 %xtraiter220, 0
  br i1 %lcmp.mod221, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter222 = phi i64 [ %prol.iter222.sub, %vector.body.prol ], [ %xtraiter220, %vector.body.prol.preheader ]
  %54 = add i64 %43, %index.prol
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %58, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter222.sub = add i64 %prol.iter222, -1
  %prol.iter222.cmp = icmp eq i64 %prol.iter222.sub, 0
  br i1 %prol.iter222.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %59 = icmp ult i64 %37, 12
  br i1 %59, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %60 = add i64 %43, %index
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %62, align 8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %64, align 8
  %index.next = add i64 %index, 4
  %65 = add i64 %43, %index.next
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %67, align 8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %69, align 8
  %index.next.1 = add i64 %index, 8
  %70 = add i64 %43, %index.next.1
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %72, align 8
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %74, align 8
  %index.next.2 = add i64 %index, 12
  %75 = add i64 %43, %index.next.2
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %77, align 8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %79, align 8
  %index.next.3 = add i64 %index, 16
  %80 = icmp eq i64 %index.next.3, %n.vec
  br i1 %80, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %42, %n.vec
  br i1 %cmp.n, label %._crit_edge28, label %.lr.ph27.preheader208

.lr.ph27.preheader208:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph27.preheader
  %indvars.iv121.ph = phi i64 [ %43, %min.iters.checked ], [ %43, %.lr.ph27.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph27

.lr.ph27:                                         ; preds = %.lr.ph27.preheader208, %.lr.ph27
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %.lr.ph27 ], [ %indvars.iv121.ph, %.lr.ph27.preheader208 ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv121
  store double 0.000000e+00, double* %81, align 8
  %exitcond = icmp eq i64 %indvars.iv121, %wide.trip.count
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  br i1 %exitcond, label %._crit_edge28.loopexit, label %.lr.ph27, !llvm.loop !6

._crit_edge28.loopexit:                           ; preds = %.lr.ph27
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %middle.block, %._crit_edge24
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv123
  store double 1.000000e+00, double* %82, align 8
  %indvars.iv.next116 = add i32 %indvars.iv115, 1
  br i1 %53, label %.preheader14, label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge28
  br label %.preheader15._crit_edge

.preheader15._crit_edge:                          ; preds = %.preheader15..preheader15._crit_edge_crit_edge, %.preheader15.thread, %._crit_edge30
  %83 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %84 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %83, i8** %84, align 8
  %85 = bitcast i8* %83 to [2000 x [2000 x double]]*
  br i1 %10, label %.preheader13.lr.ph, label %.preheader12.thread

.preheader12.thread:                              ; preds = %.preheader15._crit_edge
  br label %.preheader9

.preheader13.lr.ph:                               ; preds = %.preheader15._crit_edge
  br i1 true, label %.preheader13.lr.ph..preheader13.us_crit_edge, label %.preheader13.lr.ph..preheader12_crit_edge

.preheader13.lr.ph..preheader12_crit_edge:        ; preds = %.preheader13.lr.ph
  br label %.preheader12

.preheader13.lr.ph..preheader13.us_crit_edge:     ; preds = %.preheader13.lr.ph
  %86 = add i32 %0, -1
  %87 = zext i32 %86 to i64
  %88 = shl nuw nsw i64 %87, 3
  %89 = add nuw nsw i64 %88, 8
  %90 = sext i32 %0 to i64
  %91 = add nsw i64 %90, -1
  %xtraiter217 = and i64 %90, 3
  %lcmp.mod218 = icmp eq i64 %xtraiter217, 0
  br i1 %lcmp.mod218, label %._crit_edge22.us.prol.loopexit, label %._crit_edge22.us.prol.preheader

._crit_edge22.us.prol.preheader:                  ; preds = %.preheader13.lr.ph..preheader13.us_crit_edge
  br label %._crit_edge22.us.prol

._crit_edge22.us.prol:                            ; preds = %._crit_edge22.us.prol, %._crit_edge22.us.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %._crit_edge22.us.prol ], [ 0, %._crit_edge22.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge22.us.prol ], [ 0, %._crit_edge22.us.prol.preheader ]
  %prol.iter219 = phi i64 [ %prol.iter219.sub, %._crit_edge22.us.prol ], [ %xtraiter217, %._crit_edge22.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvar.prol, i64 0
  %scevgep107.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.prol, i8 0, i64 %89, i32 8, i1 false)
  %indvars.iv.next109.prol = add i64 %indvars.iv108.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter219.sub = add i64 %prol.iter219, -1
  %prol.iter219.cmp = icmp eq i64 %prol.iter219.sub, 0
  br i1 %prol.iter219.cmp, label %._crit_edge22.us.prol.loopexit.unr-lcssa, label %._crit_edge22.us.prol, !llvm.loop !8

._crit_edge22.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge22.us.prol
  br label %._crit_edge22.us.prol.loopexit

._crit_edge22.us.prol.loopexit:                   ; preds = %.preheader13.lr.ph..preheader13.us_crit_edge, %._crit_edge22.us.prol.loopexit.unr-lcssa
  %indvars.iv108.unr = phi i64 [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ], [ %indvars.iv.next109.prol, %._crit_edge22.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.preheader13.lr.ph..preheader13.us_crit_edge ], [ %indvar.next.prol, %._crit_edge22.us.prol.loopexit.unr-lcssa ]
  %92 = icmp ult i64 %91, 3
  br i1 %92, label %.preheader12.loopexit, label %.preheader13.lr.ph..preheader13.us_crit_edge.new

.preheader13.lr.ph..preheader13.us_crit_edge.new: ; preds = %._crit_edge22.us.prol.loopexit
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us, %.preheader13.lr.ph..preheader13.us_crit_edge.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %.preheader13.lr.ph..preheader13.us_crit_edge.new ], [ %indvars.iv.next109.3, %._crit_edge22.us ]
  %indvar = phi i64 [ %indvar.unr, %.preheader13.lr.ph..preheader13.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge22.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvar, i64 0
  %scevgep107 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107, i8 0, i64 %89, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvar.next, i64 0
  %scevgep107.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.1, i8 0, i64 %89, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvar.next.1, i64 0
  %scevgep107.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.2, i8 0, i64 %89, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvar.next.2, i64 0
  %scevgep107.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.3, i8 0, i64 %89, i32 8, i1 false)
  %indvars.iv.next109.3 = add i64 %indvars.iv108, 4
  %93 = icmp slt i64 %indvars.iv.next109.3, %90
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %93, label %._crit_edge22.us, label %.preheader12.loopexit.unr-lcssa

.preheader12.loopexit.unr-lcssa:                  ; preds = %._crit_edge22.us
  br label %.preheader12.loopexit

.preheader12.loopexit:                            ; preds = %._crit_edge22.us.prol.loopexit, %.preheader12.loopexit.unr-lcssa
  %.pr133.pre = load i32, i32* %6, align 4
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader13.lr.ph..preheader12_crit_edge, %.preheader12.loopexit
  %94 = phi i32 [ %0, %.preheader13.lr.ph..preheader12_crit_edge ], [ %.pr133.pre, %.preheader12.loopexit ]
  %95 = icmp sgt i32 %94, 0
  br i1 %95, label %.preheader11.lr.ph, label %.preheader9

.preheader11.lr.ph:                               ; preds = %.preheader12
  %96 = load [2000 x double]*, [2000 x double]** %7, align 8
  %97 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  br i1 true, label %.preheader11.lr.ph..preheader11.us_crit_edge, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %.preheader11.lr.ph
  br i1 undef, label %.preheader11.prol.preheader, label %.preheader11.prol.loopexit

.preheader11.prol.preheader:                      ; preds = %.preheader11.preheader
  br label %.preheader11.prol

.preheader11.prol:                                ; preds = %.preheader11.prol, %.preheader11.prol.preheader
  br i1 false, label %.preheader11.prol, label %.preheader11.prol.loopexit.unr-lcssa, !llvm.loop !9

.preheader11.prol.loopexit.unr-lcssa:             ; preds = %.preheader11.prol
  br label %.preheader11.prol.loopexit

.preheader11.prol.loopexit:                       ; preds = %.preheader11.prol.loopexit.unr-lcssa, %.preheader11.preheader
  br i1 undef, label %..preheader9_crit_edge.loopexit, label %.preheader11.preheader.new

.preheader11.preheader.new:                       ; preds = %.preheader11.prol.loopexit
  br label %.preheader11

.preheader11.lr.ph..preheader11.us_crit_edge:     ; preds = %.preheader11.lr.ph
  %98 = add i32 %94, -1
  %99 = sext i32 %94 to i64
  %wide.trip.count99 = zext i32 %98 to i64
  %100 = add nuw nsw i64 %wide.trip.count99, 1
  %101 = add nuw nsw i64 %wide.trip.count99, 1
  %min.iters.check141 = icmp ult i64 %100, 4
  %n.vec144 = and i64 %100, 8589934588
  %cmp.zero145 = icmp eq i64 %n.vec144, 0
  %cmp.n167 = icmp eq i64 %100, %n.vec144
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge20.us-lcssa.us.us, %.preheader11.lr.ph..preheader11.us_crit_edge
  %indvar153 = phi i64 [ %102, %._crit_edge20.us-lcssa.us.us ], [ 0, %.preheader11.lr.ph..preheader11.us_crit_edge ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge20.us-lcssa.us.us ], [ 0, %.preheader11.lr.ph..preheader11.us_crit_edge ]
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %96, i64 0, i64 %indvar153
  %102 = add i64 %indvar153, 1
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %96, i64 %wide.trip.count99, i64 %102
  br i1 true, label %.preheader10.lr.ph.us, label %.preheader11.us.._crit_edge20.us-lcssa.us.us_crit_edge

.preheader11.us.._crit_edge20.us-lcssa.us.us_crit_edge: ; preds = %.preheader11.us
  br label %._crit_edge20.us-lcssa.us.us

.preheader10.lr.ph.us:                            ; preds = %.preheader11.us
  br label %.preheader10.us.us

._crit_edge20.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge19.us.us
  br label %._crit_edge20.us-lcssa.us.us

._crit_edge20.us-lcssa.us.us:                     ; preds = %.preheader11.us.._crit_edge20.us-lcssa.us.us_crit_edge, %._crit_edge20.us-lcssa.us.us.loopexit
  %indvars.iv.next104 = add i64 %indvars.iv103, 1
  %103 = icmp slt i64 %indvars.iv.next104, %99
  br i1 %103, label %.preheader11.us, label %._crit_edge20.us-lcssa.us.us...preheader9_crit_edge_crit_edge

._crit_edge20.us-lcssa.us.us...preheader9_crit_edge_crit_edge: ; preds = %._crit_edge20.us-lcssa.us.us
  br label %..preheader9_crit_edge

.preheader10.us.us:                               ; preds = %._crit_edge19.us.us, %.preheader10.lr.ph.us
  %indvar147 = phi i64 [ %indvar.next148, %._crit_edge19.us.us ], [ 0, %.preheader10.lr.ph.us ]
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge19.us.us ], [ 0, %.preheader10.lr.ph.us ]
  %scevgep149 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvar147, i64 0
  %scevgep151 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvar147, i64 %100
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv101, i64 %indvars.iv103
  br i1 %min.iters.check141, label %scalar.ph140.preheader, label %min.iters.checked142

scalar.ph140.preheader:                           ; preds = %middle.block139, %vector.memcheck, %min.iters.checked142, %.preheader10.us.us
  %indvars.iv97.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked142 ], [ 0, %.preheader10.us.us ], [ %n.vec144, %middle.block139 ]
  %105 = sub nsw i64 %101, %indvars.iv97.ph
  %xtraiter212 = and i64 %105, 1
  %lcmp.mod213 = icmp eq i64 %xtraiter212, 0
  br i1 %lcmp.mod213, label %scalar.ph140.prol.loopexit.unr-lcssa, label %scalar.ph140.prol.preheader

scalar.ph140.prol.preheader:                      ; preds = %scalar.ph140.preheader
  br label %scalar.ph140.prol

scalar.ph140.prol:                                ; preds = %scalar.ph140.prol.preheader
  %106 = load double, double* %104, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv97.ph, i64 %indvars.iv103
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv101, i64 %indvars.iv97.ph
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  store double %112, double* %110, align 8
  %indvars.iv.next98.prol = or i64 %indvars.iv97.ph, 1
  br label %scalar.ph140.prol.loopexit.unr-lcssa

scalar.ph140.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph140.preheader, %scalar.ph140.prol
  %indvars.iv97.unr.ph = phi i64 [ %indvars.iv.next98.prol, %scalar.ph140.prol ], [ %indvars.iv97.ph, %scalar.ph140.preheader ]
  br label %scalar.ph140.prol.loopexit

scalar.ph140.prol.loopexit:                       ; preds = %scalar.ph140.prol.loopexit.unr-lcssa
  %113 = icmp eq i64 %wide.trip.count99, %indvars.iv97.ph
  br i1 %113, label %._crit_edge19.us.us.loopexit, label %scalar.ph140.preheader.new

scalar.ph140.preheader.new:                       ; preds = %scalar.ph140.prol.loopexit
  br label %scalar.ph140

min.iters.checked142:                             ; preds = %.preheader10.us.us
  br i1 %cmp.zero145, label %scalar.ph140.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked142
  %bound0 = icmp ult double* %scevgep149, %scevgep157
  %bound1 = icmp ult double* %scevgep155, %scevgep151
  %found.conflict = and i1 %bound0, %bound1
  %bound0160 = icmp ult double* %scevgep149, %104
  %bound1161 = icmp ult double* %104, %scevgep151
  %found.conflict162 = and i1 %bound0160, %bound1161
  %conflict.rdx = or i1 %found.conflict, %found.conflict162
  br i1 %conflict.rdx, label %scalar.ph140.preheader, label %vector.body138.preheader

vector.body138.preheader:                         ; preds = %vector.memcheck
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138.preheader, %vector.body138
  %index164 = phi i64 [ %index.next165, %vector.body138 ], [ 0, %vector.body138.preheader ]
  %114 = or i64 %index164, 1
  %115 = or i64 %index164, 2
  %116 = or i64 %index164, 3
  %117 = load double, double* %104, align 8, !alias.scope !10
  %118 = insertelement <2 x double> undef, double %117, i32 0
  %119 = shufflevector <2 x double> %118, <2 x double> undef, <2 x i32> zeroinitializer
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %index164, i64 %indvars.iv103
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %114, i64 %indvars.iv103
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %115, i64 %indvars.iv103
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %116, i64 %indvars.iv103
  %124 = load double, double* %120, align 8, !alias.scope !13
  %125 = load double, double* %121, align 8, !alias.scope !13
  %126 = load double, double* %122, align 8, !alias.scope !13
  %127 = load double, double* %123, align 8, !alias.scope !13
  %128 = insertelement <2 x double> undef, double %124, i32 0
  %129 = insertelement <2 x double> %128, double %125, i32 1
  %130 = insertelement <2 x double> undef, double %126, i32 0
  %131 = insertelement <2 x double> %130, double %127, i32 1
  %132 = fmul <2 x double> %119, %129
  %133 = fmul <2 x double> %119, %131
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv101, i64 %index164
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !15, !noalias !17
  %136 = getelementptr double, double* %134, i64 2
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !15, !noalias !17
  %138 = fadd <2 x double> %132, %wide.load
  %139 = fadd <2 x double> %133, %wide.load172
  store <2 x double> %138, <2 x double>* %135, align 8, !alias.scope !15, !noalias !17
  store <2 x double> %139, <2 x double>* %137, align 8, !alias.scope !15, !noalias !17
  %index.next165 = add i64 %index164, 4
  %140 = icmp eq i64 %index.next165, %n.vec144
  br i1 %140, label %middle.block139, label %vector.body138, !llvm.loop !18

middle.block139:                                  ; preds = %vector.body138
  br i1 %cmp.n167, label %._crit_edge19.us.us, label %scalar.ph140.preheader

._crit_edge19.us.us.loopexit.unr-lcssa:           ; preds = %scalar.ph140
  br label %._crit_edge19.us.us.loopexit

._crit_edge19.us.us.loopexit:                     ; preds = %scalar.ph140.prol.loopexit, %._crit_edge19.us.us.loopexit.unr-lcssa
  br label %._crit_edge19.us.us

._crit_edge19.us.us:                              ; preds = %._crit_edge19.us.us.loopexit, %middle.block139
  %indvars.iv.next102 = add i64 %indvars.iv101, 1
  %141 = icmp slt i64 %indvars.iv.next102, %99
  %indvar.next148 = add i64 %indvar147, 1
  br i1 %141, label %.preheader10.us.us, label %._crit_edge20.us-lcssa.us.us.loopexit

scalar.ph140:                                     ; preds = %scalar.ph140, %scalar.ph140.preheader.new
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %scalar.ph140.preheader.new ], [ %indvars.iv.next98.1, %scalar.ph140 ]
  %142 = load double, double* %104, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv97, i64 %indvars.iv103
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %147 = load double, double* %146, align 8
  %148 = fadd double %145, %147
  store double %148, double* %146, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %149 = load double, double* %104, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv.next98, i64 %indvars.iv103
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %154 = load double, double* %153, align 8
  %155 = fadd double %152, %154
  store double %155, double* %153, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %._crit_edge19.us.us.loopexit.unr-lcssa, label %scalar.ph140, !llvm.loop !19

.preheader11:                                     ; preds = %.preheader11, %.preheader11.preheader.new
  br i1 false, label %.preheader11, label %..preheader9_crit_edge.loopexit.unr-lcssa

..preheader9_crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader11
  br label %..preheader9_crit_edge.loopexit

..preheader9_crit_edge.loopexit:                  ; preds = %.preheader11.prol.loopexit, %..preheader9_crit_edge.loopexit.unr-lcssa
  br label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %..preheader9_crit_edge.loopexit, %._crit_edge20.us-lcssa.us.us...preheader9_crit_edge_crit_edge
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader12, %.preheader12.thread, %..preheader9_crit_edge
  %156 = phi i32 [ %94, %.preheader12 ], [ %0, %.preheader12.thread ], [ %94, %..preheader9_crit_edge ]
  %157 = icmp sgt i32 %156, 0
  br i1 %157, label %.preheader.lr.ph, label %.preheader9..preheader9._crit_edge_crit_edge

.preheader9..preheader9._crit_edge_crit_edge:     ; preds = %.preheader9
  %.pre = load i8*, i8** %84, align 8
  br label %.preheader9._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader9
  %158 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %159 = load [2000 x double]*, [2000 x double]** %7, align 8
  %160 = bitcast [2000 x [2000 x double]]* %158 to i8*
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader.._crit_edge17_crit_edge

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %161 = add i32 %156, -1
  %162 = sext i32 %156 to i64
  %wide.trip.count93 = zext i32 %161 to i64
  %163 = add nuw nsw i64 %wide.trip.count93, 1
  %164 = and i64 %163, 8589934588
  %165 = add nsw i64 %164, -4
  %166 = lshr exact i64 %165, 2
  %167 = add nuw nsw i64 %wide.trip.count93, 1
  %min.iters.check176 = icmp ult i64 %163, 4
  %n.vec179 = and i64 %163, 8589934588
  %cmp.zero180 = icmp eq i64 %n.vec179, 0
  %168 = and i64 %166, 1
  %lcmp.mod = icmp eq i64 %168, 0
  %169 = icmp eq i64 %166, 0
  %cmp.n201 = icmp eq i64 %163, %n.vec179
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvar182 = phi i64 [ %indvar.next183, %._crit_edge.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge.us ], [ 0, %.preheader.lr.ph..preheader.us_crit_edge ]
  %scevgep184 = getelementptr [2000 x double], [2000 x double]* %159, i64 %indvar182, i64 0
  %scevgep186 = getelementptr [2000 x double], [2000 x double]* %159, i64 %indvar182, i64 %163
  %scevgep188 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvar182, i64 0
  %scevgep190 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvar182, i64 %163
  br i1 %min.iters.check176, label %scalar.ph175.preheader, label %min.iters.checked177

min.iters.checked177:                             ; preds = %.preheader.us
  br i1 %cmp.zero180, label %scalar.ph175.preheader, label %vector.memcheck196

vector.memcheck196:                               ; preds = %min.iters.checked177
  %bound0192 = icmp ult double* %scevgep184, %scevgep190
  %bound1193 = icmp ult double* %scevgep188, %scevgep186
  %memcheck.conflict195 = and i1 %bound0192, %bound1193
  br i1 %memcheck.conflict195, label %scalar.ph175.preheader, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck196
  br i1 %lcmp.mod, label %vector.body173.prol.preheader, label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.preheader:                    ; preds = %vector.body173.preheader
  br label %vector.body173.prol

vector.body173.prol:                              ; preds = %vector.body173.prol.preheader
  %170 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 0
  %171 = bitcast double* %170 to <2 x i64>*
  %wide.load206.prol = load <2 x i64>, <2 x i64>* %171, align 8, !alias.scope !20
  %172 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 2
  %173 = bitcast double* %172 to <2 x i64>*
  %wide.load207.prol = load <2 x i64>, <2 x i64>* %173, align 8, !alias.scope !20
  %174 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 0
  %175 = bitcast double* %174 to <2 x i64>*
  store <2 x i64> %wide.load206.prol, <2 x i64>* %175, align 8, !alias.scope !23, !noalias !20
  %176 = getelementptr [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 2
  %177 = bitcast double* %176 to <2 x i64>*
  store <2 x i64> %wide.load207.prol, <2 x i64>* %177, align 8, !alias.scope !23, !noalias !20
  br label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.loopexit.unr-lcssa:           ; preds = %vector.body173.preheader, %vector.body173.prol
  %index198.unr.ph = phi i64 [ 4, %vector.body173.prol ], [ 0, %vector.body173.preheader ]
  br label %vector.body173.prol.loopexit

vector.body173.prol.loopexit:                     ; preds = %vector.body173.prol.loopexit.unr-lcssa
  br i1 %169, label %middle.block174, label %vector.body173.preheader.new

vector.body173.preheader.new:                     ; preds = %vector.body173.prol.loopexit
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173, %vector.body173.preheader.new
  %index198 = phi i64 [ %index198.unr.ph, %vector.body173.preheader.new ], [ %index.next199.1, %vector.body173 ]
  %178 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %index198
  %179 = bitcast double* %178 to <2 x i64>*
  %wide.load206 = load <2 x i64>, <2 x i64>* %179, align 8, !alias.scope !20
  %180 = getelementptr double, double* %178, i64 2
  %181 = bitcast double* %180 to <2 x i64>*
  %wide.load207 = load <2 x i64>, <2 x i64>* %181, align 8, !alias.scope !20
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %index198
  %183 = bitcast double* %182 to <2 x i64>*
  store <2 x i64> %wide.load206, <2 x i64>* %183, align 8, !alias.scope !23, !noalias !20
  %184 = getelementptr double, double* %182, i64 2
  %185 = bitcast double* %184 to <2 x i64>*
  store <2 x i64> %wide.load207, <2 x i64>* %185, align 8, !alias.scope !23, !noalias !20
  %index.next199 = add i64 %index198, 4
  %186 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %index.next199
  %187 = bitcast double* %186 to <2 x i64>*
  %wide.load206.1 = load <2 x i64>, <2 x i64>* %187, align 8, !alias.scope !20
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x i64>*
  %wide.load207.1 = load <2 x i64>, <2 x i64>* %189, align 8, !alias.scope !20
  %190 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %index.next199
  %191 = bitcast double* %190 to <2 x i64>*
  store <2 x i64> %wide.load206.1, <2 x i64>* %191, align 8, !alias.scope !23, !noalias !20
  %192 = getelementptr double, double* %190, i64 2
  %193 = bitcast double* %192 to <2 x i64>*
  store <2 x i64> %wide.load207.1, <2 x i64>* %193, align 8, !alias.scope !23, !noalias !20
  %index.next199.1 = add i64 %index198, 8
  %194 = icmp eq i64 %index.next199.1, %n.vec179
  br i1 %194, label %middle.block174.unr-lcssa, label %vector.body173, !llvm.loop !25

middle.block174.unr-lcssa:                        ; preds = %vector.body173
  br label %middle.block174

middle.block174:                                  ; preds = %vector.body173.prol.loopexit, %middle.block174.unr-lcssa
  br i1 %cmp.n201, label %._crit_edge.us, label %scalar.ph175.preheader

scalar.ph175.preheader:                           ; preds = %middle.block174, %vector.memcheck196, %min.iters.checked177, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck196 ], [ 0, %min.iters.checked177 ], [ 0, %.preheader.us ], [ %n.vec179, %middle.block174 ]
  %195 = sub nsw i64 %167, %indvars.iv.ph
  %196 = sub nsw i64 %wide.trip.count93, %indvars.iv.ph
  %xtraiter210 = and i64 %195, 3
  %lcmp.mod211 = icmp eq i64 %xtraiter210, 0
  br i1 %lcmp.mod211, label %scalar.ph175.prol.loopexit, label %scalar.ph175.prol.preheader

scalar.ph175.prol.preheader:                      ; preds = %scalar.ph175.preheader
  br label %scalar.ph175.prol

scalar.ph175.prol:                                ; preds = %scalar.ph175.prol, %scalar.ph175.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph175.prol ], [ %indvars.iv.ph, %scalar.ph175.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph175.prol ], [ %xtraiter210, %scalar.ph175.prol.preheader ]
  %197 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %198 = bitcast double* %197 to i64*
  %199 = load i64, i64* %198, align 8
  %200 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %indvars.iv.prol
  %201 = bitcast double* %200 to i64*
  store i64 %199, i64* %201, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph175.prol.loopexit.unr-lcssa, label %scalar.ph175.prol, !llvm.loop !26

scalar.ph175.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph175.prol
  br label %scalar.ph175.prol.loopexit

scalar.ph175.prol.loopexit:                       ; preds = %scalar.ph175.preheader, %scalar.ph175.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph175.preheader ], [ %indvars.iv.next.prol, %scalar.ph175.prol.loopexit.unr-lcssa ]
  %202 = icmp ult i64 %196, 3
  br i1 %202, label %._crit_edge.us.loopexit, label %scalar.ph175.preheader.new

scalar.ph175.preheader.new:                       ; preds = %scalar.ph175.prol.loopexit
  br label %scalar.ph175

scalar.ph175:                                     ; preds = %scalar.ph175, %scalar.ph175.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph175.preheader.new ], [ %indvars.iv.next.3, %scalar.ph175 ]
  %203 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %204 = bitcast double* %203 to i64*
  %205 = load i64, i64* %204, align 8
  %206 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %indvars.iv
  %207 = bitcast double* %206 to i64*
  store i64 %205, i64* %207, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %208 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %209 = bitcast double* %208 to i64*
  %210 = load i64, i64* %209, align 8
  %211 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %indvars.iv.next
  %212 = bitcast double* %211 to i64*
  store i64 %210, i64* %212, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %213 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %214 = bitcast double* %213 to i64*
  %215 = load i64, i64* %214, align 8
  %216 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %217 = bitcast double* %216 to i64*
  store i64 %215, i64* %217, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %218 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %158, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %219 = bitcast double* %218 to i64*
  %220 = load i64, i64* %219, align 8
  %221 = getelementptr inbounds [2000 x double], [2000 x double]* %159, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %222 = bitcast double* %221 to i64*
  store i64 %220, i64* %222, align 8
  %exitcond94.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count93
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond94.3, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph175, !llvm.loop !27

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph175
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph175.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block174
  %indvars.iv.next96 = add i64 %indvars.iv95, 1
  %223 = icmp slt i64 %indvars.iv.next96, %162
  %indvar.next183 = add i64 %indvar182, 1
  br i1 %223, label %.preheader.us, label %._crit_edge.us.._crit_edge17_crit_edge

._crit_edge.us.._crit_edge17_crit_edge:           ; preds = %._crit_edge.us
  br label %._crit_edge17

.preheader.._crit_edge17_crit_edge:               ; preds = %.preheader.lr.ph
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.preheader.._crit_edge17_crit_edge, %._crit_edge.us.._crit_edge17_crit_edge
  br label %.preheader9._crit_edge

.preheader9._crit_edge:                           ; preds = %.preheader9..preheader9._crit_edge_crit_edge, %._crit_edge17
  %224 = phi i8* [ %.pre, %.preheader9..preheader9._crit_edge_crit_edge ], [ %160, %._crit_edge17 ]
  tail call void @free(i8* %224) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader9.lr.ph, label %.preheader

.preheader9.lr.ph:                                ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count118 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count118, 1
  br label %.preheader9

.preheader9:                                      ; preds = %._crit_edge30, %.preheader9.lr.ph
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge30 ], [ 0, %.preheader9.lr.ph ]
  %indvars.iv127 = phi i32 [ %14, %._crit_edge30 ], [ -1, %.preheader9.lr.ph ]
  %10 = add i64 %indvars.iv135, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = sub i64 %9, %indvars.iv135
  %13 = sub i64 %wide.trip.count118, %indvars.iv135
  %14 = add i32 %indvars.iv127, 1
  %15 = icmp sgt i64 %indvars.iv135, 0
  br i1 %15, label %.lr.ph23.preheader, label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.preheader9
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 0
  br label %.lr.ph23

..preheader_crit_edge:                            ; preds = %._crit_edge30
  br label %.preheader

.preheader:                                       ; preds = %5, %..preheader_crit_edge
  br i1 %6, label %.lr.ph18, label %.preheader._crit_edge.thread

.preheader._crit_edge.thread:                     ; preds = %.preheader
  br label %._crit_edge74

.lr.ph18:                                         ; preds = %.preheader
  %17 = sext i32 %0 to i64
  br label %84

.lr.ph23:                                         ; preds = %.lr.ph23.preheader, %._crit_edge67
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge67 ], [ 0, %.lr.ph23.preheader ]
  %indvars.iv108 = phi i32 [ %20, %._crit_edge67 ], [ -1, %.lr.ph23.preheader ]
  %18 = add i64 %indvars.iv112, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = add i32 %indvars.iv108, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv112
  %22 = load double, double* %21, align 8
  %23 = icmp sgt i64 %indvars.iv112, 0
  br i1 %23, label %.lr.ph21, label %._crit_edge67

.lr.ph21:                                         ; preds = %.lr.ph23
  %wide.trip.count110 = zext i32 %indvars.iv108 to i64
  %24 = and i64 %18, 1
  %lcmp.mod168 = icmp eq i64 %24, 0
  br i1 %lcmp.mod168, label %.prol.preheader165, label %.prol.loopexit166.unr-lcssa

.prol.preheader165:                               ; preds = %.lr.ph21
  br label %25

; <label>:25:                                     ; preds = %.prol.preheader165
  %26 = load double, double* %16, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv112
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %22, %29
  br label %.prol.loopexit166.unr-lcssa

.prol.loopexit166.unr-lcssa:                      ; preds = %.lr.ph21, %25
  %.lcssa156.unr.ph = phi double [ %30, %25 ], [ undef, %.lr.ph21 ]
  %indvars.iv102.unr.ph = phi i64 [ 1, %25 ], [ 0, %.lr.ph21 ]
  %.unr169.ph = phi double [ %30, %25 ], [ %22, %.lr.ph21 ]
  br label %.prol.loopexit166

.prol.loopexit166:                                ; preds = %.prol.loopexit166.unr-lcssa
  %31 = icmp eq i64 %19, 0
  br i1 %31, label %._crit_edge22, label %.lr.ph21.new

.lr.ph21.new:                                     ; preds = %.prol.loopexit166
  br label %32

; <label>:32:                                     ; preds = %32, %.lr.ph21.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr.ph, %.lr.ph21.new ], [ %indvars.iv.next103.1, %32 ]
  %33 = phi double [ %.unr169.ph, %.lr.ph21.new ], [ %47, %32 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv102
  %35 = bitcast double* %34 to <2 x double>*
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv112
  %37 = load double, double* %36, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %38 = load <2 x double>, <2 x double>* %35, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next103, i64 %indvars.iv112
  %40 = load double, double* %39, align 8
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %38, %42
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %46 = fsub double %33, %44
  %47 = fsub double %46, %45
  %exitcond111.1 = icmp eq i64 %indvars.iv.next103, %wide.trip.count110
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  br i1 %exitcond111.1, label %._crit_edge22.unr-lcssa, label %32

._crit_edge22.unr-lcssa:                          ; preds = %32
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.prol.loopexit166, %._crit_edge22.unr-lcssa
  %.lcssa156 = phi double [ %.lcssa156.unr.ph, %.prol.loopexit166 ], [ %47, %._crit_edge22.unr-lcssa ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %.lr.ph23, %._crit_edge22
  %48 = phi double [ %.lcssa156, %._crit_edge22 ], [ %22, %.lr.ph23 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv112
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %21, align 8
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %52 = icmp slt i64 %indvars.iv.next113, %indvars.iv135
  br i1 %52, label %.lr.ph23, label %._crit_edge24.loopexit

._crit_edge24.loopexit:                           ; preds = %._crit_edge67
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %.preheader9
  %53 = icmp slt i64 %indvars.iv135, %8
  br i1 %53, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %._crit_edge24
  br i1 %15, label %.lr.ph29.split.us.preheader, label %.lr.ph29.split.preheader

.lr.ph29.split.preheader:                         ; preds = %.lr.ph29
  %xtraiter170 = and i64 %12, 3
  %lcmp.mod171 = icmp eq i64 %xtraiter170, 0
  br i1 %lcmp.mod171, label %.lr.ph29.split.prol.loopexit, label %.lr.ph29.split.prol.preheader

.lr.ph29.split.prol.preheader:                    ; preds = %.lr.ph29.split.preheader
  br label %.lr.ph29.split.prol

.lr.ph29.split.prol:                              ; preds = %.lr.ph29.split.prol, %.lr.ph29.split.prol.preheader
  %indvars.iv116.prol = phi i64 [ %indvars.iv.next117.prol, %.lr.ph29.split.prol ], [ %indvars.iv135, %.lr.ph29.split.prol.preheader ]
  %prol.iter172 = phi i64 [ %prol.iter172.sub, %.lr.ph29.split.prol ], [ %xtraiter170, %.lr.ph29.split.prol.preheader ]
  %indvars.iv.next117.prol = add i64 %indvars.iv116.prol, 1
  %prol.iter172.sub = add i64 %prol.iter172, -1
  %prol.iter172.cmp = icmp eq i64 %prol.iter172.sub, 0
  br i1 %prol.iter172.cmp, label %.lr.ph29.split.prol.loopexit.unr-lcssa, label %.lr.ph29.split.prol, !llvm.loop !28

.lr.ph29.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph29.split.prol
  br label %.lr.ph29.split.prol.loopexit

.lr.ph29.split.prol.loopexit:                     ; preds = %.lr.ph29.split.preheader, %.lr.ph29.split.prol.loopexit.unr-lcssa
  %indvars.iv116.unr = phi i64 [ %indvars.iv135, %.lr.ph29.split.preheader ], [ %indvars.iv.next117.prol, %.lr.ph29.split.prol.loopexit.unr-lcssa ]
  %54 = icmp ult i64 %13, 3
  br i1 %54, label %._crit_edge30.loopexit138, label %.lr.ph29.split.preheader.new

.lr.ph29.split.preheader.new:                     ; preds = %.lr.ph29.split.prol.loopexit
  br label %.lr.ph29.split

.lr.ph29.split.us.preheader:                      ; preds = %.lr.ph29
  %wide.trip.count129 = zext i32 %indvars.iv127 to i64
  %55 = and i64 %10, 1
  %lcmp.mod176 = icmp eq i64 %55, 0
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 0
  %57 = icmp eq i64 %11, 0
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge27.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge27.us ], [ %indvars.iv135, %.lr.ph29.split.us.preheader ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv133
  %59 = load double, double* %58, align 8
  br i1 %lcmp.mod176, label %.prol.preheader173, label %.prol.loopexit174.unr-lcssa

.prol.preheader173:                               ; preds = %.lr.ph29.split.us
  br label %60

; <label>:60:                                     ; preds = %.prol.preheader173
  %61 = load double, double* %56, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv133
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  br label %.prol.loopexit174.unr-lcssa

.prol.loopexit174.unr-lcssa:                      ; preds = %.lr.ph29.split.us, %60
  %.lcssa158.unr.ph = phi double [ %65, %60 ], [ undef, %.lr.ph29.split.us ]
  %indvars.iv121.unr.ph = phi i64 [ 1, %60 ], [ 0, %.lr.ph29.split.us ]
  %.unr177.ph = phi double [ %65, %60 ], [ %59, %.lr.ph29.split.us ]
  br label %.prol.loopexit174

.prol.loopexit174:                                ; preds = %.prol.loopexit174.unr-lcssa
  br i1 %57, label %._crit_edge27.us, label %.lr.ph29.split.us.new

.lr.ph29.split.us.new:                            ; preds = %.prol.loopexit174
  br label %66

; <label>:66:                                     ; preds = %66, %.lr.ph29.split.us.new
  %indvars.iv121 = phi i64 [ %indvars.iv121.unr.ph, %.lr.ph29.split.us.new ], [ %indvars.iv.next122.1, %66 ]
  %67 = phi double [ %.unr177.ph, %.lr.ph29.split.us.new ], [ %81, %66 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv121
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv133
  %71 = load double, double* %70, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next122, i64 %indvars.iv133
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %71, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %72, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %67, %78
  %81 = fsub double %80, %79
  %exitcond130.1 = icmp eq i64 %indvars.iv.next122, %wide.trip.count129
  %indvars.iv.next122.1 = add nsw i64 %indvars.iv121, 2
  br i1 %exitcond130.1, label %._crit_edge27.us.unr-lcssa, label %66

._crit_edge27.us.unr-lcssa:                       ; preds = %66
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %.prol.loopexit174, %._crit_edge27.us.unr-lcssa
  %.lcssa158 = phi double [ %.lcssa158.unr.ph, %.prol.loopexit174 ], [ %81, %._crit_edge27.us.unr-lcssa ]
  store double %.lcssa158, double* %58, align 8
  %indvars.iv.next134 = add i64 %indvars.iv133, 1
  %82 = icmp slt i64 %indvars.iv.next134, %8
  br i1 %82, label %.lr.ph29.split.us, label %._crit_edge30.loopexit

.lr.ph29.split:                                   ; preds = %.lr.ph29.split, %.lr.ph29.split.preheader.new
  %indvars.iv116 = phi i64 [ %indvars.iv116.unr, %.lr.ph29.split.preheader.new ], [ %indvars.iv.next117.3, %.lr.ph29.split ]
  %indvars.iv.next117.2 = add i64 %indvars.iv116, 3
  %exitcond119.3 = icmp eq i64 %indvars.iv.next117.2, %wide.trip.count118
  %indvars.iv.next117.3 = add i64 %indvars.iv116, 4
  br i1 %exitcond119.3, label %._crit_edge30.loopexit138.unr-lcssa, label %.lr.ph29.split

._crit_edge30.loopexit138.unr-lcssa:              ; preds = %.lr.ph29.split
  br label %._crit_edge30.loopexit138

._crit_edge30.loopexit138:                        ; preds = %.lr.ph29.split.prol.loopexit, %._crit_edge30.loopexit138.unr-lcssa
  br label %._crit_edge30

._crit_edge30.loopexit:                           ; preds = %._crit_edge27.us
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %._crit_edge30.loopexit138, %._crit_edge24
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %83 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %83, label %.preheader9, label %..preheader_crit_edge

; <label>:84:                                     ; preds = %._crit_edge71, %.lr.ph18
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge71 ], [ 0, %.lr.ph18 ]
  %indvars.iv96 = phi i32 [ %indvars.iv.next97, %._crit_edge71 ], [ -1, %.lr.ph18 ]
  %85 = add i64 %indvars.iv100, 4294967295
  %86 = and i64 %85, 4294967295
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv100
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = icmp sgt i64 %indvars.iv100, 0
  %91 = bitcast i64 %89 to double
  br i1 %90, label %.lr.ph16, label %._crit_edge71

.lr.ph16:                                         ; preds = %84
  %wide.trip.count98 = zext i32 %indvars.iv96 to i64
  %xtraiter161 = and i64 %indvars.iv100, 3
  %lcmp.mod162 = icmp eq i64 %xtraiter161, 0
  br i1 %lcmp.mod162, label %.prol.loopexit160, label %.prol.preheader159

.prol.preheader159:                               ; preds = %.lr.ph16
  br label %92

; <label>:92:                                     ; preds = %92, %.prol.preheader159
  %indvars.iv90.prol = phi i64 [ %indvars.iv.next91.prol, %92 ], [ 0, %.prol.preheader159 ]
  %93 = phi double [ %99, %92 ], [ %91, %.prol.preheader159 ]
  %prol.iter163 = phi i64 [ %prol.iter163.sub, %92 ], [ %xtraiter161, %.prol.preheader159 ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv90.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv90.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %93, %98
  %indvars.iv.next91.prol = add nuw nsw i64 %indvars.iv90.prol, 1
  %prol.iter163.sub = add i64 %prol.iter163, -1
  %prol.iter163.cmp = icmp eq i64 %prol.iter163.sub, 0
  br i1 %prol.iter163.cmp, label %.prol.loopexit160.unr-lcssa, label %92, !llvm.loop !29

.prol.loopexit160.unr-lcssa:                      ; preds = %92
  br label %.prol.loopexit160

.prol.loopexit160:                                ; preds = %.lr.ph16, %.prol.loopexit160.unr-lcssa
  %.lcssa155.unr = phi double [ undef, %.lr.ph16 ], [ %99, %.prol.loopexit160.unr-lcssa ]
  %indvars.iv90.unr = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next91.prol, %.prol.loopexit160.unr-lcssa ]
  %.unr164 = phi double [ %91, %.lr.ph16 ], [ %99, %.prol.loopexit160.unr-lcssa ]
  %100 = icmp ult i64 %86, 3
  br i1 %100, label %._crit_edge17, label %.lr.ph16.new

.lr.ph16.new:                                     ; preds = %.prol.loopexit160
  br label %101

; <label>:101:                                    ; preds = %101, %.lr.ph16.new
  %indvars.iv90 = phi i64 [ %indvars.iv90.unr, %.lr.ph16.new ], [ %indvars.iv.next91.3, %101 ]
  %102 = phi double [ %.unr164, %.lr.ph16.new ], [ %124, %101 ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv90
  %104 = bitcast double* %103 to <2 x double>*
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %104, align 8
  %108 = load <2 x double>, <2 x double>* %106, align 8
  %109 = fmul <2 x double> %107, %108
  %110 = extractelement <2 x double> %109, i32 0
  %111 = extractelement <2 x double> %109, i32 1
  %112 = fsub double %102, %110
  %113 = fsub double %112, %111
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv100, i64 %indvars.iv.next91.1
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next91.1
  %117 = bitcast double* %116 to <2 x double>*
  %indvars.iv.next91.2 = add nsw i64 %indvars.iv90, 3
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %113, %121
  %124 = fsub double %123, %122
  %exitcond99.3 = icmp eq i64 %indvars.iv.next91.2, %wide.trip.count98
  %indvars.iv.next91.3 = add nsw i64 %indvars.iv90, 4
  br i1 %exitcond99.3, label %._crit_edge17.unr-lcssa, label %101

._crit_edge17.unr-lcssa:                          ; preds = %101
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %.prol.loopexit160, %._crit_edge17.unr-lcssa
  %.lcssa155 = phi double [ %.lcssa155.unr, %.prol.loopexit160 ], [ %124, %._crit_edge17.unr-lcssa ]
  %125 = bitcast double %.lcssa155 to i64
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %84, %._crit_edge17
  %126 = phi i64 [ %89, %84 ], [ %125, %._crit_edge17 ]
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv100
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next101 = add i64 %indvars.iv100, 1
  %129 = icmp slt i64 %indvars.iv.next101, %17
  %indvars.iv.next97 = add i32 %indvars.iv96, 1
  br i1 %129, label %84, label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %._crit_edge71
  br i1 true, label %.lr.ph13, label %.preheader._crit_edge.._crit_edge74_crit_edge

.preheader._crit_edge.._crit_edge74_crit_edge:    ; preds = %.preheader._crit_edge
  br label %._crit_edge74

.lr.ph13:                                         ; preds = %.preheader._crit_edge
  %storemerge211 = add i32 %0, -1
  %130 = sext i32 %storemerge211 to i64
  %131 = add nsw i64 %130, 1
  br label %132

; <label>:132:                                    ; preds = %._crit_edge75, %.lr.ph13
  %indvar = phi i32 [ %indvar.next, %._crit_edge75 ], [ 0, %.lr.ph13 ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %._crit_edge75 ], [ %130, %.lr.ph13 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge75 ], [ %0, %.lr.ph13 ]
  %133 = sub i32 %0, %indvar
  %134 = sext i32 %133 to i64
  %135 = sub nsw i64 %130, %134
  %136 = getelementptr inbounds double, double* %4, i64 %indvars.iv87
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv87, 1
  %139 = icmp slt i64 %138, %17
  br i1 %139, label %.lr.ph, label %._crit_edge75

.lr.ph:                                           ; preds = %132
  %140 = sub nsw i64 %131, %134
  %141 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %140, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %142

; <label>:142:                                    ; preds = %142, %.prol.preheader
  %indvars.iv85.prol = phi i64 [ %indvars.iv.next86.prol, %142 ], [ %141, %.prol.preheader ]
  %143 = phi double [ %149, %142 ], [ %137, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %142 ], [ %xtraiter, %.prol.preheader ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv85.prol
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv85.prol
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fsub double %143, %148
  %indvars.iv.next86.prol = add nsw i64 %indvars.iv85.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %142, !llvm.loop !30

.prol.loopexit.unr-lcssa:                         ; preds = %142
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %149, %.prol.loopexit.unr-lcssa ]
  %indvars.iv85.unr = phi i64 [ %141, %.lr.ph ], [ %indvars.iv.next86.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %137, %.lr.ph ], [ %149, %.prol.loopexit.unr-lcssa ]
  %150 = icmp ult i64 %135, 3
  br i1 %150, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %151

; <label>:151:                                    ; preds = %151, %.lr.ph.new
  %indvars.iv85 = phi i64 [ %indvars.iv85.unr, %.lr.ph.new ], [ %indvars.iv.next86.3, %151 ]
  %152 = phi double [ %.unr, %.lr.ph.new ], [ %174, %151 ]
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv85
  %154 = bitcast double* %153 to <2 x double>*
  %155 = getelementptr inbounds double, double* %3, i64 %indvars.iv85
  %156 = bitcast double* %155 to <2 x double>*
  %157 = load <2 x double>, <2 x double>* %154, align 8
  %158 = load <2 x double>, <2 x double>* %156, align 8
  %159 = fmul <2 x double> %157, %158
  %160 = extractelement <2 x double> %159, i32 0
  %161 = extractelement <2 x double> %159, i32 1
  %162 = fsub double %152, %160
  %163 = fsub double %162, %161
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, 2
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv.next86.1
  %165 = bitcast double* %164 to <2 x double>*
  %166 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next86.1
  %167 = bitcast double* %166 to <2 x double>*
  %indvars.iv.next86.2 = add nsw i64 %indvars.iv85, 3
  %168 = load <2 x double>, <2 x double>* %165, align 8
  %169 = load <2 x double>, <2 x double>* %167, align 8
  %170 = fmul <2 x double> %168, %169
  %171 = extractelement <2 x double> %170, i32 0
  %172 = extractelement <2 x double> %170, i32 1
  %173 = fsub double %163, %171
  %174 = fsub double %173, %172
  %exitcond.3 = icmp eq i64 %indvars.iv.next86.2, %130
  %indvars.iv.next86.3 = add nsw i64 %indvars.iv85, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %151

._crit_edge.unr-lcssa:                            ; preds = %151
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %174, %._crit_edge.unr-lcssa ]
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %132, %._crit_edge
  %175 = phi double [ %137, %132 ], [ %.lcssa, %._crit_edge ]
  %176 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv87
  %177 = load double, double* %176, align 8
  %178 = fdiv double %175, %177
  %179 = getelementptr inbounds double, double* %3, i64 %indvars.iv87
  store double %178, double* %179, align 8
  %indvars.iv.next88 = add i64 %indvars.iv87, -1
  %180 = icmp sgt i64 %indvars.iv87, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %180, label %132, label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge75
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %.preheader._crit_edge.._crit_edge74_crit_edge, %.preheader._crit_edge.thread, %._crit_edge14
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
  br i1 %7, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge._crit_edge, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %2, %._crit_edge2
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !2}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = distinct !{!16, !12}
!17 = !{!14, !11}
!18 = distinct !{!18, !4, !5}
!19 = distinct !{!19, !4, !5}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !4, !5}
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !4, !5}
!28 = distinct !{!28, !2}
!29 = distinct !{!29, !2}
!30 = distinct !{!30, !2}
