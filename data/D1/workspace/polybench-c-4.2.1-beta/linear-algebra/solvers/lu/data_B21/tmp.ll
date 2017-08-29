; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader71.lr.ph, label %._crit_edge100.thread

._crit_edge100.thread:                            ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge74

.preheader71.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count152 = zext i32 %0 to i64
  br label %.lr.ph93

.lr.ph93:                                         ; preds = %._crit_edge98, %.preheader71.lr.ph
  %indvars.iv150 = phi i64 [ 0, %.preheader71.lr.ph ], [ %9, %._crit_edge98 ]
  %indvars.iv148 = phi i64 [ 1, %.preheader71.lr.ph ], [ %indvars.iv.next149, %._crit_edge98 ]
  %9 = add nuw nsw i64 %indvars.iv150, 1
  %10 = sub i64 %7, %indvars.iv150
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph93
  %indvars.iv133 = phi i64 [ 0, %.lr.ph93 ], [ %indvars.iv.next134, %._crit_edge ]
  %13 = sub nsw i64 0, %indvars.iv133
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %5
  %18 = fadd double %17, 1.000000e+00
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv133
  store double %18, double* %19, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next134, %indvars.iv148
  br i1 %exitcond138, label %._crit_edge94, label %._crit_edge

._crit_edge94:                                    ; preds = %._crit_edge
  %20 = icmp slt i64 %9, %8
  br i1 %20, label %.lr.ph97.preheader, label %._crit_edge98

.lr.ph97.preheader:                               ; preds = %._crit_edge94
  %21 = add nuw nsw i64 %12, 8
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %9
  %22 = mul nuw nsw i64 %indvars.iv150, 2000
  %scevgep146 = getelementptr double, double* %scevgep145, i64 %22
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep146147, i8 0, i64 %21, i32 8, i1 false)
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge94, %.lr.ph97.preheader
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %23, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond153 = icmp eq i64 %9, %wide.trip.count152
  br i1 %exitcond153, label %.preheader70.us.preheader, label %.lr.ph93

.preheader70.us.preheader:                        ; preds = %._crit_edge98
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = add i32 %0, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = add nuw nsw i64 %27, 8
  %xtraiter130 = and i32 %0, 3
  %lcmp.mod131 = icmp eq i32 %xtraiter130, 0
  br i1 %lcmp.mod131, label %.preheader70.us.prol.loopexit, label %._crit_edge90.us.prol.preheader

._crit_edge90.us.prol.preheader:                  ; preds = %.preheader70.us.preheader
  %29 = add nsw i32 %xtraiter130, -1
  %30 = zext i32 %29 to i64
  br label %._crit_edge90.us.prol

._crit_edge90.us.prol:                            ; preds = %._crit_edge90.us.prol.preheader, %._crit_edge90.us.prol
  %indvars.iv126.prol = phi i64 [ %indvars.iv.next127.prol, %._crit_edge90.us.prol ], [ 0, %._crit_edge90.us.prol.preheader ]
  %prol.iter132 = phi i32 [ %prol.iter132.sub, %._crit_edge90.us.prol ], [ %xtraiter130, %._crit_edge90.us.prol.preheader ]
  %31 = mul nuw nsw i64 %indvars.iv126.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next127.prol = add nuw nsw i64 %indvars.iv126.prol, 1
  %prol.iter132.sub = add nsw i32 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i32 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %.preheader70.us.prol.loopexit.loopexit, label %._crit_edge90.us.prol, !llvm.loop !1

.preheader70.us.prol.loopexit.loopexit:           ; preds = %._crit_edge90.us.prol
  %32 = add nuw nsw i64 %30, 1
  br label %.preheader70.us.prol.loopexit

.preheader70.us.prol.loopexit:                    ; preds = %.preheader70.us.prol.loopexit.loopexit, %.preheader70.us.preheader
  %indvars.iv126.unr = phi i64 [ 0, %.preheader70.us.preheader ], [ %32, %.preheader70.us.prol.loopexit.loopexit ]
  %33 = icmp ult i32 %25, 3
  br i1 %33, label %.preheader68.lr.ph, label %._crit_edge90.us.3.preheader

._crit_edge90.us.3.preheader:                     ; preds = %.preheader70.us.prol.loopexit
  %34 = add nsw i64 %wide.trip.count152, -4
  %35 = sub nsw i64 %34, %indvars.iv126.unr
  %36 = lshr i64 %35, 2
  %37 = and i64 %36, 1
  %lcmp.mod = icmp eq i64 %37, 0
  br i1 %lcmp.mod, label %._crit_edge90.us.3.prol, label %._crit_edge90.us.3.prol.loopexit

._crit_edge90.us.3.prol:                          ; preds = %._crit_edge90.us.3.preheader
  %38 = mul nsw i64 %indvars.iv126.unr, 16000
  %scevgep.prol163 = getelementptr i8, i8* %24, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol163, i8 0, i64 %28, i32 8, i1 false)
  %39 = add i64 %38, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %28, i32 8, i1 false)
  %40 = add i64 %38, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %28, i32 8, i1 false)
  %41 = add i64 %38, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next127.3.prol = add nsw i64 %indvars.iv126.unr, 4
  br label %._crit_edge90.us.3.prol.loopexit

._crit_edge90.us.3.prol.loopexit:                 ; preds = %._crit_edge90.us.3.prol, %._crit_edge90.us.3.preheader
  %indvars.iv126.unr164 = phi i64 [ %indvars.iv126.unr, %._crit_edge90.us.3.preheader ], [ %indvars.iv.next127.3.prol, %._crit_edge90.us.3.prol ]
  %42 = icmp eq i64 %36, 0
  br i1 %42, label %.preheader68.lr.ph, label %._crit_edge90.us.3.preheader.new

._crit_edge90.us.3.preheader.new:                 ; preds = %._crit_edge90.us.3.prol.loopexit
  br label %._crit_edge90.us.3

.preheader68.lr.ph.loopexit:                      ; preds = %._crit_edge90.us.3
  br label %.preheader68.lr.ph

.preheader68.lr.ph:                               ; preds = %.preheader68.lr.ph.loopexit, %._crit_edge90.us.3.prol.loopexit, %.preheader70.us.prol.loopexit
  %xtraiter112 = and i32 %0, 1
  %43 = icmp eq i32 %xtraiter112, 0
  %44 = icmp eq i32 %0, 1
  %45 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge79.us, %.preheader68.lr.ph
  %indvars.iv118 = phi i64 [ 0, %.preheader68.lr.ph ], [ %indvars.iv.next119, %._crit_edge79.us ]
  %sunkaddr159 = shl i64 %indvars.iv118, 3
  %sunkaddr160 = add i64 %sunkaddr, %sunkaddr159
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to double*
  br label %.preheader67.us.us

._crit_edge79.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next119, %wide.trip.count152
  br i1 %exitcond121, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge79.us
  %47 = add nsw i32 %xtraiter130, -1
  %48 = zext i32 %47 to i64
  %49 = add nuw nsw i64 %48, 1
  %50 = icmp eq i32 %xtraiter130, 0
  %51 = icmp ult i32 %25, 3
  %52 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %53 = bitcast i8* %24 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge77.us.us, %.preheader67.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next115, %._crit_edge77.us.us ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv118
  br i1 %43, label %.prol.loopexit111, label %55

; <label>:55:                                     ; preds = %.preheader67.us.us
  %56 = load double, double* %54, align 8
  %57 = load double, double* %sunkaddr161, align 8
  %58 = fmul double %56, %57
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv114, i64 0
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.preheader67.us.us, %55
  %indvars.iv106.unr.ph = phi i64 [ 1, %55 ], [ 0, %.preheader67.us.us ]
  br i1 %44, label %._crit_edge77.us.us, label %.preheader67.us.us.new.preheader

.preheader67.us.us.new.preheader:                 ; preds = %.prol.loopexit111
  br label %.preheader67.us.us.new

._crit_edge77.us.us.loopexit:                     ; preds = %.preheader67.us.us.new
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %.prol.loopexit111
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count152
  br i1 %exitcond117, label %._crit_edge79.us, label %.preheader67.us.us

.preheader67.us.us.new:                           ; preds = %.preheader67.us.us.new.preheader, %.preheader67.us.us.new
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.preheader67.us.us.new ], [ %indvars.iv106.unr.ph, %.preheader67.us.us.new.preheader ]
  %62 = load double, double* %54, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv118
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv114, i64 %indvars.iv106
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %69 = load double, double* %54, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next107, i64 %indvars.iv118
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv114, i64 %indvars.iv.next107
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, %wide.trip.count152
  br i1 %exitcond109.1, label %._crit_edge77.us.us.loopexit, label %.preheader67.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %50, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter130, %.prol.preheader.preheader ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv103, i64 %indvars.iv.prol
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.prol
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %49, %.prol.loopexit.loopexit ]
  br i1 %51, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv103, i64 %indvars.iv
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv.next.2
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count152
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond = icmp eq i64 %indvars.iv.next104, %wide.trip.count152
  br i1 %exitcond, label %._crit_edge74.loopexit, label %.preheader.us

._crit_edge74.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge100.thread
  %101 = phi i8* [ %4, %._crit_edge100.thread ], [ %24, %._crit_edge74.loopexit ]
  tail call void @free(i8* %101) #3
  ret void

._crit_edge90.us.3:                               ; preds = %._crit_edge90.us.3, %._crit_edge90.us.3.preheader.new
  %indvars.iv126 = phi i64 [ %indvars.iv126.unr164, %._crit_edge90.us.3.preheader.new ], [ %indvars.iv.next127.3.1, %._crit_edge90.us.3 ]
  %102 = mul i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %28, i32 8, i1 false)
  %103 = add i64 %102, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %28, i32 8, i1 false)
  %104 = add i64 %102, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %28, i32 8, i1 false)
  %105 = add i64 %102, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %28, i32 8, i1 false)
  %106 = mul i64 %indvars.iv126, 16000
  %107 = add i64 %106, 64000
  %scevgep.1165 = getelementptr i8, i8* %24, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1165, i8 0, i64 %28, i32 8, i1 false)
  %108 = add i64 %106, 80000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %108
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %28, i32 8, i1 false)
  %109 = add i64 %106, 96000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %109
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %28, i32 8, i1 false)
  %110 = add i64 %106, 112000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next127.3.1 = add nsw i64 %indvars.iv126, 8
  %exitcond129.3.1 = icmp eq i64 %indvars.iv.next127.3.1, %wide.trip.count152
  br i1 %exitcond129.3.1, label %.preheader68.lr.ph.loopexit, label %._crit_edge90.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader43.preheader, label %._crit_edge54

.preheader43.preheader:                           ; preds = %2
  %wide.trip.count90 = zext i32 %0 to i64
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.preheader, %._crit_edge50
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %4 = add nuw i64 %indvars.iv88, 4294967295
  %5 = icmp sgt i64 %indvars.iv88, 0
  br i1 %5, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter7792 = and i64 %indvars.iv88, 1
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i64 %xtraiter7792, 0
  %9 = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge48.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge48.us ], [ %indvars.iv88, %.preheader.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv82
  %.pre58 = load double, double* %10, align 8
  br i1 %8, label %.prol.loopexit76, label %11

; <label>:11:                                     ; preds = %.preheader.us
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv82
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre58, %15
  store double %16, double* %10, align 8
  br label %.prol.loopexit76

.prol.loopexit76:                                 ; preds = %.preheader.us, %11
  %indvars.iv70.unr.ph = phi i64 [ 1, %11 ], [ 0, %.preheader.us ]
  %.unr79.ph = phi double [ %16, %11 ], [ %.pre58, %.preheader.us ]
  br i1 %9, label %._crit_edge48.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit76
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv70 = phi i64 [ %indvars.iv.next71.1, %.preheader.us.new ], [ %indvars.iv70.unr.ph, %.preheader.us.new.preheader ]
  %17 = phi double [ %29, %.preheader.us.new ], [ %.unr79.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv70
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv82
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv.next71
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next71, i64 %indvars.iv82
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next71.1 = add nuw nsw i64 %indvars.iv70, 2
  %exitcond74.1 = icmp eq i64 %indvars.iv.next71.1, %indvars.iv88
  br i1 %exitcond74.1, label %._crit_edge48.us.loopexit, label %.preheader.us.new

._crit_edge48.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit76
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count90
  br i1 %exitcond85, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %30 = add nuw i64 %indvars.iv64, 4294967295
  %31 = icmp sgt i64 %indvars.iv64, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv64
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %xtraiter93 = and i64 %indvars.iv64, 1
  %lcmp.mod = icmp eq i64 %xtraiter93, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %33

; <label>:33:                                     ; preds = %.lr.ph
  %34 = load double, double* %6, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv64
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.pre, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %33
  %indvars.iv.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %38, %33 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = phi double [ %53, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv64
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv88, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv64
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv64
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41, %.prol.loopexit
  %54 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader41 ], [ %53, %._crit_edge.loopexit ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv64, i64 %indvars.iv64
  %56 = load double, double* %55, align 8
  %57 = fdiv double %54, %56
  store double %57, double* %32, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, %indvars.iv88
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %._crit_edge54.loopexit, label %.preheader43

._crit_edge54.loopexit:                           ; preds = %._crit_edge50
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge18
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge18, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
