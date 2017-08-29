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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
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
  call fastcc void @print_array(double* %9)
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
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph112:
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph112
  %indvars.iv73110 = phi i64 [ 0, %.lr.ph112 ], [ %indvars.iv.next74.1, %4 ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv73110
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv73110
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next74 = or i64 %indvars.iv73110, 1
  %9 = trunc i64 %indvars.iv.next74 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv73110
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next74.1 = add nuw nsw i64 %indvars.iv73110, 2
  %12 = trunc i64 %indvars.iv.next74.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %20 = icmp slt i64 %indvars.iv.next74.1, 2000
  br i1 %20, label %4, label %._crit_edge.preheader.preheader

._crit_edge.preheader.preheader:                  ; preds = %4
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.preheader, %.loopexit194
  %indvars.iv = phi i64 [ 1995, %._crit_edge.preheader.preheader ], [ %indvars.iv.next203, %.loopexit194 ]
  %indvars.iv69108 = phi i64 [ %indvars.iv.next70, %.loopexit194 ], [ 1, %._crit_edge.preheader.preheader ]
  %indvars.iv71106 = phi i64 [ %indvars.iv.next62102, %.loopexit194 ], [ 0, %._crit_edge.preheader.preheader ]
  %21 = lshr i64 %indvars.iv, 2
  %22 = add i64 %21, 1
  %23 = trunc i64 %22 to i2
  %24 = zext i2 %23 to i64
  %25 = shl i64 %24, 2
  %26 = sub nuw nsw i64 1999, %indvars.iv71106
  %27 = add nsw i64 %26, -4
  %28 = lshr i64 %27, 2
  %29 = add nuw nsw i64 %28, 1
  br label %._crit_edge

._crit_edge75.preheader:                          ; preds = %._crit_edge
  %30 = sub nuw nsw i64 1999, %indvars.iv71106
  %indvars.iv.next62102 = add nuw nsw i64 %indvars.iv71106, 1
  %exitcond68103 = icmp eq i64 %indvars.iv71106, 1999
  br i1 %exitcond68103, label %.loopexit194, label %.lr.ph105

.lr.ph105:                                        ; preds = %._crit_edge75.preheader
  %min.iters.check = icmp ult i64 %30, 4
  br i1 %min.iters.check, label %._crit_edge75.preheader200, label %min.iters.checked

._crit_edge75.preheader200:                       ; preds = %middle.block, %min.iters.checked, %.lr.ph105
  %indvars.iv.next62104.ph = phi i64 [ %indvars.iv.next62102, %min.iters.checked ], [ %indvars.iv.next62102, %.lr.ph105 ], [ %ind.end, %middle.block ]
  br label %._crit_edge75

min.iters.checked:                                ; preds = %.lr.ph105
  %n.vec = and i64 %30, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv.next62102, %n.vec
  br i1 %cmp.zero, label %._crit_edge75.preheader200, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %29, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %31 = add nuw nsw i64 %indvars.iv.next62102, %index.prol
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %35, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %25, %vector.body.prol.loopexit.unr-lcssa ]
  %36 = icmp ult i64 %27, 12
  br i1 %36, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %37 = add i64 %indvars.iv.next62102, %index
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %41, align 8
  %index.next = add i64 %index, 4
  %42 = add i64 %indvars.iv.next62102, %index.next
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %44, align 8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %46, align 8
  %index.next.1 = add i64 %index, 8
  %47 = add i64 %indvars.iv.next62102, %index.next.1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %49, align 8
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %51, align 8
  %index.next.2 = add i64 %index, 12
  %52 = add i64 %indvars.iv.next62102, %index.next.2
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %56, align 8
  %index.next.3 = add i64 %index, 16
  %57 = icmp eq i64 %index.next.3, %n.vec
  br i1 %57, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %30, %n.vec
  br i1 %cmp.n, label %.loopexit194, label %._crit_edge75.preheader200

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv53101 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next54, %._crit_edge ]
  %58 = sub nsw i64 0, %indvars.iv53101
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 2000
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, 2.000000e+03
  %63 = fadd double %62, 1.000000e+00
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %indvars.iv53101
  store double %63, double* %64, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53101, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv69108
  br i1 %exitcond58, label %._crit_edge75.preheader, label %._crit_edge

._crit_edge75:                                    ; preds = %._crit_edge75.preheader200, %._crit_edge75
  %indvars.iv.next62104 = phi i64 [ %indvars.iv.next62, %._crit_edge75 ], [ %indvars.iv.next62104.ph, %._crit_edge75.preheader200 ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71106, i64 %indvars.iv.next62104
  store double 0.000000e+00, double* %65, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv.next62104, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next62104, 1999
  br i1 %exitcond68, label %.loopexit194.loopexit, label %._crit_edge75, !llvm.loop !6

.loopexit194.loopexit:                            ; preds = %._crit_edge75
  br label %.loopexit194

.loopexit194:                                     ; preds = %.loopexit194.loopexit, %middle.block, %._crit_edge75.preheader
  %indvars.iv71107 = phi i64 [ 1999, %._crit_edge75.preheader ], [ %indvars.iv71106, %middle.block ], [ %indvars.iv71106, %.loopexit194.loopexit ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71107, i64 %indvars.iv71106
  store double 1.000000e+00, double* %66, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69108, 1
  %indvars.iv.next203 = add nsw i64 %indvars.iv, -1
  %exitcond204 = icmp ne i64 %indvars.iv.next62102, 2000
  br i1 %exitcond204, label %._crit_edge.preheader, label %.loopexit195

.loopexit195:                                     ; preds = %.loopexit194
  %67 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %68 = bitcast i8* %67 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %67 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %67 to [2000 x [2000 x double]]*
  %71 = bitcast i8* %67 to [2000 x [2000 x double]]*
  %72 = bitcast i8* %67 to [2000 x [2000 x double]]*
  br label %._crit_edge76.preheader

._crit_edge76.preheader:                          ; preds = %.loopexit195, %middle.block116
  %indvars.iv5199 = phi i64 [ 0, %.loopexit195 ], [ %indvars.iv.next52, %middle.block116 ]
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115, %._crit_edge76.preheader
  %index124 = phi i64 [ 0, %._crit_edge76.preheader ], [ %index.next125.4, %vector.body115 ]
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv5199, i64 %index124
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %74, align 8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %76, align 8
  %index.next125 = add nuw nsw i64 %index124, 4
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv5199, i64 %index.next125
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %78, align 8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %80, align 8
  %index.next125.1 = add nuw nsw i64 %index124, 8
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv5199, i64 %index.next125.1
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %82, align 8
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %84, align 8
  %index.next125.2 = add nuw nsw i64 %index124, 12
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %72, i64 0, i64 %indvars.iv5199, i64 %index.next125.2
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %86, align 8
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %88, align 8
  %index.next125.3 = add nuw nsw i64 %index124, 16
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv5199, i64 %index.next125.3
  %90 = bitcast double* %89 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %90, align 8
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %92, align 8
  %index.next125.4 = add nuw nsw i64 %index124, 20
  %93 = icmp eq i64 %index.next125.4, 2000
  br i1 %93, label %middle.block116, label %vector.body115, !llvm.loop !8

middle.block116:                                  ; preds = %vector.body115
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5199, 1
  %exitcond202 = icmp ne i64 %indvars.iv.next52, 2000
  br i1 %exitcond202, label %._crit_edge76.preheader, label %._crit_edge78.preheader.preheader

._crit_edge78.preheader.preheader:                ; preds = %middle.block116
  br label %._crit_edge78.preheader

._crit_edge78.preheader:                          ; preds = %._crit_edge78.preheader.preheader, %.loopexit192
  %indvars.iv4594 = phi i64 [ %indvars.iv.next46, %.loopexit192 ], [ 0, %._crit_edge78.preheader.preheader ]
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4594
  %94 = add nsw i64 %indvars.iv4594, -1999
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %0, i64 2000, i64 %94
  %95 = bitcast double* %scevgep144 to i8*
  %96 = bitcast double* %scevgep142 to i8*
  br label %.lr.ph88

.lr.ph88:                                         ; preds = %._crit_edge78, %._crit_edge78.preheader
  %indvars.iv4191 = phi i64 [ 0, %._crit_edge78.preheader ], [ %indvars.iv.next42, %._crit_edge78 ]
  %97 = mul nuw nsw i64 %indvars.iv4191, 16000
  %scevgep = getelementptr i8, i8* %67, i64 %97
  %98 = add nuw nsw i64 %97, 16000
  %scevgep141 = getelementptr i8, i8* %67, i64 %98
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4191, i64 %indvars.iv4594
  %bound0 = icmp ult i8* %scevgep, %95
  %bound1 = icmp ult i8* %96, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %99 to i8*
  %bound0147 = icmp ult i8* %scevgep, %bc
  %bound1148 = icmp ult i8* %bc, %scevgep141
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %scalar.ph134.preheader, label %vector.body132.preheader

vector.body132.preheader:                         ; preds = %.lr.ph88
  br label %vector.body132

scalar.ph134.preheader:                           ; preds = %.lr.ph88
  br label %scalar.ph134

vector.body132:                                   ; preds = %vector.body132.preheader, %vector.body132
  %index151 = phi i64 [ %index.next152, %vector.body132 ], [ 0, %vector.body132.preheader ]
  %100 = or i64 %index151, 1
  %101 = or i64 %index151, 2
  %102 = or i64 %index151, 3
  %103 = load double, double* %99, align 8, !alias.scope !9
  %104 = insertelement <2 x double> undef, double %103, i32 0
  %105 = shufflevector <2 x double> %104, <2 x double> undef, <2 x i32> zeroinitializer
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index151, i64 %indvars.iv4594
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %100, i64 %indvars.iv4594
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %101, i64 %indvars.iv4594
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %102, i64 %indvars.iv4594
  %110 = load double, double* %106, align 8, !alias.scope !12
  %111 = load double, double* %107, align 8, !alias.scope !12
  %112 = load double, double* %108, align 8, !alias.scope !12
  %113 = load double, double* %109, align 8, !alias.scope !12
  %114 = insertelement <2 x double> undef, double %110, i32 0
  %115 = insertelement <2 x double> %114, double %111, i32 1
  %116 = insertelement <2 x double> undef, double %112, i32 0
  %117 = insertelement <2 x double> %116, double %113, i32 1
  %118 = fmul <2 x double> %105, %115
  %119 = fmul <2 x double> %105, %117
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv4191, i64 %index151
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !14, !noalias !16
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !14, !noalias !16
  %124 = fadd <2 x double> %wide.load, %118
  %125 = fadd <2 x double> %wide.load159, %119
  store <2 x double> %124, <2 x double>* %121, align 8, !alias.scope !14, !noalias !16
  store <2 x double> %125, <2 x double>* %123, align 8, !alias.scope !14, !noalias !16
  %index.next152 = add nuw nsw i64 %index151, 4
  %126 = icmp eq i64 %index.next152, 2000
  br i1 %126, label %._crit_edge78.loopexit199, label %vector.body132, !llvm.loop !17

scalar.ph134:                                     ; preds = %scalar.ph134, %scalar.ph134.preheader
  %indvars.iv3786 = phi i64 [ 0, %scalar.ph134.preheader ], [ %indvars.iv.next38.1, %scalar.ph134 ]
  %127 = load double, double* %99, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3786, i64 %indvars.iv4594
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv4191, i64 %indvars.iv3786
  %132 = load double, double* %131, align 8
  %133 = fadd double %132, %130
  store double %133, double* %131, align 8
  %indvars.iv.next38 = or i64 %indvars.iv3786, 1
  %134 = load double, double* %99, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next38, i64 %indvars.iv4594
  %136 = load double, double* %135, align 8
  %137 = fmul double %134, %136
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv4191, i64 %indvars.iv.next38
  %139 = load double, double* %138, align 8
  %140 = fadd double %139, %137
  store double %140, double* %138, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv3786, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next38.1, 2000
  br i1 %exitcond40.1, label %._crit_edge78.loopexit, label %scalar.ph134, !llvm.loop !18

._crit_edge78.loopexit:                           ; preds = %scalar.ph134
  br label %._crit_edge78

._crit_edge78.loopexit199:                        ; preds = %vector.body132
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.loopexit199, %._crit_edge78.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv4191, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 2000
  br i1 %exitcond44, label %.loopexit192, label %.lr.ph88

.loopexit192:                                     ; preds = %._crit_edge78
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4594, 1
  %exitcond201 = icmp ne i64 %indvars.iv.next46, 2000
  br i1 %exitcond201, label %._crit_edge78.preheader, label %._crit_edge79.preheader.preheader

._crit_edge79.preheader.preheader:                ; preds = %.loopexit192
  br label %._crit_edge79.preheader

._crit_edge79.preheader:                          ; preds = %._crit_edge79.preheader.preheader, %middle.block161
  %indvars.iv3582 = phi i64 [ %indvars.iv.next36, %middle.block161 ], [ 0, %._crit_edge79.preheader.preheader ]
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 0
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 2000
  %141 = mul nuw nsw i64 %indvars.iv3582, 16000
  %scevgep173 = getelementptr i8, i8* %67, i64 %141
  %142 = add nuw nsw i64 %141, 16000
  %scevgep174 = getelementptr i8, i8* %67, i64 %142
  %143 = bitcast double* %scevgep171 to i8*
  %144 = bitcast double* %scevgep169 to i8*
  %bound0175 = icmp ult i8* %144, %scevgep174
  %bound1176 = icmp ult i8* %scevgep173, %143
  %memcheck.conflict178 = and i1 %bound0175, %bound1176
  br i1 %memcheck.conflict178, label %._crit_edge79.preheader197, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %._crit_edge79.preheader
  br label %vector.body160

._crit_edge79.preheader197:                       ; preds = %._crit_edge79.preheader
  br label %._crit_edge79

vector.body160:                                   ; preds = %vector.body160, %vector.body160.preheader
  %index181 = phi i64 [ 0, %vector.body160.preheader ], [ %index.next182.1, %vector.body160 ]
  %145 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %index181
  %146 = bitcast double* %145 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %146, align 8, !alias.scope !19
  %147 = getelementptr double, double* %145, i64 2
  %148 = bitcast double* %147 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !19
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %index181
  %150 = bitcast double* %149 to <2 x i64>*
  store <2 x i64> %wide.load189, <2 x i64>* %150, align 8, !alias.scope !22, !noalias !19
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %152, align 8, !alias.scope !22, !noalias !19
  %index.next182 = or i64 %index181, 4
  %153 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %index.next182
  %154 = bitcast double* %153 to <2 x i64>*
  %wide.load189.1 = load <2 x i64>, <2 x i64>* %154, align 8, !alias.scope !19
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %156, align 8, !alias.scope !19
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %index.next182
  %158 = bitcast double* %157 to <2 x i64>*
  store <2 x i64> %wide.load189.1, <2 x i64>* %158, align 8, !alias.scope !22, !noalias !19
  %159 = getelementptr double, double* %157, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %160, align 8, !alias.scope !22, !noalias !19
  %index.next182.1 = add nuw nsw i64 %index181, 8
  %161 = icmp eq i64 %index.next182.1, 2000
  br i1 %161, label %middle.block161.loopexit198, label %vector.body160, !llvm.loop !24

._crit_edge79:                                    ; preds = %._crit_edge79, %._crit_edge79.preheader197
  %indvars.iv81 = phi i64 [ 0, %._crit_edge79.preheader197 ], [ %indvars.iv.next.4, %._crit_edge79 ]
  %162 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %indvars.iv81
  %163 = bitcast double* %162 to i64*
  %164 = load i64, i64* %163, align 8
  %165 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv81
  %166 = bitcast double* %165 to i64*
  store i64 %164, i64* %166, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv81, 1
  %167 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %indvars.iv.next
  %168 = bitcast double* %167 to i64*
  %169 = load i64, i64* %168, align 8
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv.next
  %171 = bitcast double* %170 to i64*
  store i64 %169, i64* %171, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv81, 2
  %172 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %indvars.iv.next.1
  %173 = bitcast double* %172 to i64*
  %174 = load i64, i64* %173, align 8
  %175 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv.next.1
  %176 = bitcast double* %175 to i64*
  store i64 %174, i64* %176, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv81, 3
  %177 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %indvars.iv.next.2
  %178 = bitcast double* %177 to i64*
  %179 = load i64, i64* %178, align 8
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv.next.2
  %181 = bitcast double* %180 to i64*
  store i64 %179, i64* %181, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv81, 4
  %182 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv3582, i64 %indvars.iv.next.3
  %183 = bitcast double* %182 to i64*
  %184 = load i64, i64* %183, align 8
  %185 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3582, i64 %indvars.iv.next.3
  %186 = bitcast double* %185 to i64*
  store i64 %184, i64* %186, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv81, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block161.loopexit, label %._crit_edge79, !llvm.loop !25

middle.block161.loopexit:                         ; preds = %._crit_edge79
  br label %middle.block161

middle.block161.loopexit198:                      ; preds = %vector.body160
  br label %middle.block161

middle.block161:                                  ; preds = %middle.block161.loopexit198, %middle.block161.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv3582, 1
  %exitcond = icmp ne i64 %indvars.iv.next36, 2000
  br i1 %exitcond, label %._crit_edge79.preheader, label %.loopexit191

.loopexit191:                                     ; preds = %middle.block161
  call void @free(i8* %67) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %.loopexit124
  %indvars.iv65107 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next66, %.loopexit124 ]
  %cond = icmp eq i64 %indvars.iv65107, 0
  br i1 %cond, label %.lr.ph106.preheader, label %.lr.ph96.preheader

.lr.ph96.preheader:                               ; preds = %.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 0
  br label %.lr.ph96

.lr.ph106.preheader:                              ; preds = %._crit_edge31.preheader, %.preheader
  %indvars.iv61104.ph = phi i64 [ %indvars.iv65107, %._crit_edge31.preheader ], [ 0, %.preheader ]
  %xtraiter136 = and i64 %indvars.iv65107, 1
  %lcmp.mod137 = icmp eq i64 %xtraiter136, 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 0
  %6 = icmp eq i64 %indvars.iv65107, 1
  br label %.lr.ph106

._crit_edge31.preheader:                          ; preds = %.loopexit123
  br i1 false, label %.loopexit124, label %.lr.ph106.preheader

.lr.ph96:                                         ; preds = %.lr.ph96.preheader, %.loopexit123
  %indvars.iv5194 = phi i64 [ %indvars.iv.next52, %.loopexit123 ], [ 0, %.lr.ph96.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 %indvars.iv5194
  %8 = load double, double* %7, align 8
  %exitcond5087 = icmp eq i64 %indvars.iv5194, 0
  br i1 %exitcond5087, label %.loopexit123, label %.lr.ph90.preheader

.lr.ph90.preheader:                               ; preds = %.lr.ph96
  %xtraiter133 = and i64 %indvars.iv5194, 1
  %lcmp.mod134 = icmp eq i64 %xtraiter133, 0
  br i1 %lcmp.mod134, label %.lr.ph90.prol.loopexit.unr-lcssa, label %.lr.ph90.prol.preheader

.lr.ph90.prol.preheader:                          ; preds = %.lr.ph90.preheader
  br label %.lr.ph90.prol

.lr.ph90.prol:                                    ; preds = %.lr.ph90.prol.preheader
  %9 = load double, double* %4, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv5194
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %8, %12
  br label %.lr.ph90.prol.loopexit.unr-lcssa

.lr.ph90.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph90.preheader, %.lr.ph90.prol
  %.lcssa127.unr.ph = phi double [ %13, %.lr.ph90.prol ], [ undef, %.lr.ph90.preheader ]
  %.unr135.ph = phi double [ %13, %.lr.ph90.prol ], [ %8, %.lr.ph90.preheader ]
  %indvars.iv88.unr.ph = phi i64 [ 1, %.lr.ph90.prol ], [ 0, %.lr.ph90.preheader ]
  br label %.lr.ph90.prol.loopexit

.lr.ph90.prol.loopexit:                           ; preds = %.lr.ph90.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %indvars.iv5194, 1
  br i1 %14, label %.loopexit123.loopexit, label %.lr.ph90.preheader.new

.lr.ph90.preheader.new:                           ; preds = %.lr.ph90.prol.loopexit
  br label %.lr.ph90

.lr.ph90:                                         ; preds = %.lr.ph90, %.lr.ph90.preheader.new
  %15 = phi double [ %.unr135.ph, %.lr.ph90.preheader.new ], [ %29, %.lr.ph90 ]
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr.ph, %.lr.ph90.preheader.new ], [ %indvars.iv.next.1, %.lr.ph90 ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 %indvars.iv88
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv88, i64 %indvars.iv5194
  %19 = load double, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv88, 1
  %20 = load <2 x double>, <2 x double>* %17, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv5194
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %19, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %20, %24
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fsub double %15, %26
  %29 = fsub double %28, %27
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv88, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv5194
  br i1 %exitcond50.1, label %.loopexit123.loopexit.unr-lcssa, label %.lr.ph90

.loopexit123.loopexit.unr-lcssa:                  ; preds = %.lr.ph90
  br label %.loopexit123.loopexit

.loopexit123.loopexit:                            ; preds = %.lr.ph90.prol.loopexit, %.loopexit123.loopexit.unr-lcssa
  %.lcssa127 = phi double [ %.lcssa127.unr.ph, %.lr.ph90.prol.loopexit ], [ %29, %.loopexit123.loopexit.unr-lcssa ]
  br label %.loopexit123

.loopexit123:                                     ; preds = %.loopexit123.loopexit, %.lr.ph96
  %indvars.iv5195 = phi i64 [ 0, %.lr.ph96 ], [ %indvars.iv5194, %.loopexit123.loopexit ]
  %.lcssa68 = phi double [ %8, %.lr.ph96 ], [ %.lcssa127, %.loopexit123.loopexit ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5195, i64 %indvars.iv5194
  %31 = load double, double* %30, align 8
  %32 = fdiv double %.lcssa68, %31
  store double %32, double* %7, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5194, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next52, %indvars.iv65107
  br i1 %exitcond55, label %._crit_edge31.preheader, label %.lr.ph96

.lr.ph106:                                        ; preds = %.lr.ph106.preheader, %._crit_edge31
  %indvars.iv61104 = phi i64 [ %indvars.iv.next62, %._crit_edge31 ], [ %indvars.iv61104.ph, %.lr.ph106.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 %indvars.iv61104
  %34 = load double, double* %33, align 8
  br i1 %cond, label %._crit_edge31, label %.lr.ph100.preheader

.lr.ph100.preheader:                              ; preds = %.lr.ph106
  br i1 %lcmp.mod137, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol.preheader
  %35 = load double, double* %5, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv61104
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %34, %38
  br label %.lr.ph100.prol.loopexit.unr-lcssa

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.preheader, %.lr.ph100.prol
  %.lcssa128.unr.ph = phi double [ %39, %.lr.ph100.prol ], [ undef, %.lr.ph100.preheader ]
  %.unr138.ph = phi double [ %39, %.lr.ph100.prol ], [ %34, %.lr.ph100.preheader ]
  %indvars.iv2998.unr.ph = phi i64 [ 1, %.lr.ph100.prol ], [ 0, %.lr.ph100.preheader ]
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.prol.loopexit.unr-lcssa
  br i1 %6, label %._crit_edge31.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %40 = phi double [ %.unr138.ph, %.lr.ph100.preheader.new ], [ %54, %.lr.ph100 ]
  %indvars.iv2998 = phi i64 [ %indvars.iv2998.unr.ph, %.lr.ph100.preheader.new ], [ %indvars.iv.next30.1, %.lr.ph100 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65107, i64 %indvars.iv2998
  %42 = bitcast double* %41 to <2 x double>*
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv2998, i64 %indvars.iv61104
  %44 = load double, double* %43, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2998, 1
  %45 = load <2 x double>, <2 x double>* %42, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next30, i64 %indvars.iv61104
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %45, %49
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fsub double %40, %51
  %54 = fsub double %53, %52
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv2998, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next30.1, %indvars.iv65107
  br i1 %exitcond58.1, label %._crit_edge31.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge31.loopexit.unr-lcssa:                 ; preds = %.lr.ph100
  br label %._crit_edge31.loopexit

._crit_edge31.loopexit:                           ; preds = %.lr.ph100.prol.loopexit, %._crit_edge31.loopexit.unr-lcssa
  %.lcssa128 = phi double [ %.lcssa128.unr.ph, %.lr.ph100.prol.loopexit ], [ %54, %._crit_edge31.loopexit.unr-lcssa ]
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %.lr.ph106
  %.lcssa69 = phi double [ %34, %.lr.ph106 ], [ %.lcssa128, %._crit_edge31.loopexit ]
  store double %.lcssa69, double* %33, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61104, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond64, label %.loopexit124.loopexit, label %.lr.ph106

.loopexit124.loopexit:                            ; preds = %._crit_edge31
  br label %.loopexit124

.loopexit124:                                     ; preds = %.loopexit124.loopexit, %._crit_edge31.preheader
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65107, 1
  %exitcond151 = icmp ne i64 %indvars.iv.next66, 2000
  br i1 %exitcond151, label %.preheader, label %.lr.ph86.preheader

.lr.ph86.preheader:                               ; preds = %.loopexit124
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %.lr.ph86.preheader, %.loopexit122
  %indvars.iv148 = phi i2 [ 0, %.lr.ph86.preheader ], [ %indvars.iv.next149, %.loopexit122 ]
  %indvars.iv4684 = phi i64 [ %indvars.iv.next47, %.loopexit122 ], [ 0, %.lr.ph86.preheader ]
  %55 = zext i2 %indvars.iv148 to i64
  %56 = add nsw i64 %indvars.iv4684, -1
  %57 = getelementptr inbounds double, double* %1, i64 %indvars.iv4684
  %58 = load double, double* %57, align 8
  %exitcond78 = icmp eq i64 %indvars.iv4684, 0
  br i1 %exitcond78, label %.loopexit122, label %.lr.ph81.preheader

.lr.ph81.preheader:                               ; preds = %.lr.ph86
  %xtraiter129 = and i64 %indvars.iv4684, 3
  %lcmp.mod130 = icmp eq i64 %xtraiter129, 0
  br i1 %lcmp.mod130, label %.lr.ph81.prol.loopexit, label %.lr.ph81.prol.preheader

.lr.ph81.prol.preheader:                          ; preds = %.lr.ph81.preheader
  br label %.lr.ph81.prol

.lr.ph81.prol:                                    ; preds = %.lr.ph81.prol, %.lr.ph81.prol.preheader
  %59 = phi double [ %65, %.lr.ph81.prol ], [ %58, %.lr.ph81.prol.preheader ]
  %indvars.iv4279.prol = phi i64 [ %indvars.iv.next43.prol, %.lr.ph81.prol ], [ 0, %.lr.ph81.prol.preheader ]
  %prol.iter131 = phi i64 [ %prol.iter131.sub, %.lr.ph81.prol ], [ %xtraiter129, %.lr.ph81.prol.preheader ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4684, i64 %indvars.iv4279.prol
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv4279.prol
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fsub double %59, %64
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv4279.prol, 1
  %prol.iter131.sub = add nsw i64 %prol.iter131, -1
  %prol.iter131.cmp = icmp eq i64 %prol.iter131.sub, 0
  br i1 %prol.iter131.cmp, label %.lr.ph81.prol.loopexit.unr-lcssa, label %.lr.ph81.prol, !llvm.loop !26

.lr.ph81.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph81.prol
  br label %.lr.ph81.prol.loopexit

.lr.ph81.prol.loopexit:                           ; preds = %.lr.ph81.preheader, %.lr.ph81.prol.loopexit.unr-lcssa
  %.lcssa126.unr = phi double [ undef, %.lr.ph81.preheader ], [ %65, %.lr.ph81.prol.loopexit.unr-lcssa ]
  %.unr132 = phi double [ %58, %.lr.ph81.preheader ], [ %65, %.lr.ph81.prol.loopexit.unr-lcssa ]
  %indvars.iv4279.unr = phi i64 [ 0, %.lr.ph81.preheader ], [ %55, %.lr.ph81.prol.loopexit.unr-lcssa ]
  %66 = icmp ult i64 %56, 3
  br i1 %66, label %.loopexit122.loopexit, label %.lr.ph81.preheader.new

.lr.ph81.preheader.new:                           ; preds = %.lr.ph81.prol.loopexit
  br label %.lr.ph81

.lr.ph81:                                         ; preds = %.lr.ph81, %.lr.ph81.preheader.new
  %67 = phi double [ %.unr132, %.lr.ph81.preheader.new ], [ %89, %.lr.ph81 ]
  %indvars.iv4279 = phi i64 [ %indvars.iv4279.unr, %.lr.ph81.preheader.new ], [ %indvars.iv.next43.3, %.lr.ph81 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4684, i64 %indvars.iv4279
  %69 = bitcast double* %68 to <2 x double>*
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv4279
  %71 = bitcast double* %70 to <2 x double>*
  %72 = load <2 x double>, <2 x double>* %69, align 8
  %73 = load <2 x double>, <2 x double>* %71, align 8
  %74 = fmul <2 x double> %72, %73
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fsub double %67, %75
  %78 = fsub double %77, %76
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv4279, 2
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4684, i64 %indvars.iv.next43.1
  %80 = bitcast double* %79 to <2 x double>*
  %81 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next43.1
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %80, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %85 = fmul <2 x double> %83, %84
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = fsub double %78, %86
  %89 = fsub double %88, %87
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv4279, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv4684
  br i1 %exitcond.3, label %.loopexit122.loopexit.unr-lcssa, label %.lr.ph81

.loopexit122.loopexit.unr-lcssa:                  ; preds = %.lr.ph81
  br label %.loopexit122.loopexit

.loopexit122.loopexit:                            ; preds = %.lr.ph81.prol.loopexit, %.loopexit122.loopexit.unr-lcssa
  %.lcssa126 = phi double [ %.lcssa126.unr, %.lr.ph81.prol.loopexit ], [ %89, %.loopexit122.loopexit.unr-lcssa ]
  br label %.loopexit122

.loopexit122:                                     ; preds = %.loopexit122.loopexit, %.lr.ph86
  %indvars.iv4685 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv4684, %.loopexit122.loopexit ]
  %.lcssa67 = phi double [ %58, %.lr.ph86 ], [ %.lcssa126, %.loopexit122.loopexit ]
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv4685
  store double %.lcssa67, double* %90, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4684, 1
  %indvars.iv.next149 = add i2 %indvars.iv148, 1
  %exitcond150 = icmp ne i64 %indvars.iv.next47, 2000
  br i1 %exitcond150, label %.lr.ph86, label %.lr.ph76.preheader

.lr.ph76.preheader:                               ; preds = %.loopexit122
  %sunkaddr = ptrtoint double* %2 to i64
  br label %.lr.ph76

.lr.ph76:                                         ; preds = %.lr.ph76.preheader, %.loopexit
  %indvars.iv146 = phi i2 [ 0, %.lr.ph76.preheader ], [ %indvars.iv.next147, %.loopexit ]
  %indvars.iv = phi i64 [ 2000, %.lr.ph76.preheader ], [ %indvars.iv.next145, %.loopexit ]
  %indvar = phi i64 [ 0, %.lr.ph76.preheader ], [ %indvar.next, %.loopexit ]
  %91 = zext i2 %indvars.iv146 to i64
  %92 = add i64 %indvars.iv, %91
  %93 = add nsw i64 %indvar, -1
  %indvars.iv.next145 = add nsw i64 %indvars.iv, -1
  %94 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next145
  %95 = load double, double* %94, align 8
  %96 = icmp slt i64 %indvars.iv, 2000
  br i1 %96, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %.lr.ph76
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %97 = phi double [ %103, %.lr.ph.prol ], [ %95, %.lr.ph.prol.preheader ]
  %indvars.iv3870.prol = phi i64 [ %indvars.iv.next39.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next145, i64 %indvars.iv3870.prol
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds double, double* %2, i64 %indvars.iv3870.prol
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fsub double %97, %102
  %indvars.iv.next39.prol = add nuw nsw i64 %indvars.iv3870.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !27

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol.loopexit.unr-lcssa
  %.unr = phi double [ %95, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv3870.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %92, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.lcssa125.unr = phi double [ undef, %.lr.ph.preheader ], [ %103, %.lr.ph.prol.loopexit.unr-lcssa ]
  %104 = icmp ult i64 %93, 3
  br i1 %104, label %.loopexit.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %105 = phi double [ %.unr, %.lr.ph.preheader.new ], [ %127, %.lr.ph ]
  %indvars.iv3870 = phi i64 [ %indvars.iv3870.unr, %.lr.ph.preheader.new ], [ %indvars.iv.next39.3, %.lr.ph ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next145, i64 %indvars.iv3870
  %107 = bitcast double* %106 to <2 x double>*
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv3870
  %109 = bitcast double* %108 to <2 x double>*
  %110 = load <2 x double>, <2 x double>* %107, align 8
  %111 = load <2 x double>, <2 x double>* %109, align 8
  %112 = fmul <2 x double> %110, %111
  %113 = extractelement <2 x double> %112, i32 0
  %114 = extractelement <2 x double> %112, i32 1
  %115 = fsub double %105, %113
  %116 = fsub double %115, %114
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv3870, 2
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next145, i64 %indvars.iv.next39.1
  %118 = bitcast double* %117 to <2 x double>*
  %119 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next39.1
  %120 = bitcast double* %119 to <2 x double>*
  %121 = load <2 x double>, <2 x double>* %118, align 8
  %122 = load <2 x double>, <2 x double>* %120, align 8
  %123 = fmul <2 x double> %121, %122
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fsub double %116, %124
  %127 = fsub double %126, %125
  %indvars.iv.next39.3 = add nsw i64 %indvars.iv3870, 4
  %128 = icmp slt i64 %indvars.iv.next39.3, 2000
  br i1 %128, label %.lr.ph, label %.loopexit.loopexit.unr-lcssa

.loopexit.loopexit.unr-lcssa:                     ; preds = %.lr.ph
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  %.lcssa125 = phi double [ %.lcssa125.unr, %.lr.ph.prol.loopexit ], [ %127, %.loopexit.loopexit.unr-lcssa ]
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.lr.ph76
  %.lcssa = phi double [ %95, %.lr.ph76 ], [ %.lcssa125, %.loopexit.loopexit ]
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next145, i64 %indvars.iv.next145
  %130 = load double, double* %129, align 8
  %131 = fdiv double %.lcssa, %130
  %sunkaddr117 = shl i64 %indvars.iv, 3
  %sunkaddr118 = add i64 %sunkaddr, %sunkaddr117
  %sunkaddr119 = add i64 %sunkaddr118, -8
  %sunkaddr120 = inttoptr i64 %sunkaddr119 to double*
  store double %131, double* %sunkaddr120, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %indvars.iv.next147 = add i2 %indvars.iv146, 1
  %exitcond = icmp ne i64 %indvar.next, 2000
  br i1 %exitcond, label %.lr.ph76, label %.loopexit121

.loopexit121:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv1 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %5, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!13, !10}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}
!25 = distinct !{!25, !4, !5}
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !2}
